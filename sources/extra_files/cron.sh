#!/bin/bash

if [ ! -f .env ]
then
    export $(cat cron.env | grep -v -E "^#" | xargs)
fi

FILE_UPLOAD_BYTES_PER_MB=1048576
FILE_UPLOAD_BYTES_LIMIT=$(($FILES_SIZE*$FILE_UPLOAD_BYTES_PER_MB))

# Searching for new users in the last 10 minutes without a Pro_Plan subscription.
mysql --password=$DB_PASSWORD --database=$DB_DATABASE <<< " \
        SELECT email FROM users WHERE created_at >= DATE_SUB( TIMESTAMP(NOW()), INTERVAL 10 MINUTE) AND NOT EXISTS( SELECT * FROM user_subscriptions WHERE user_subscriptions.plan_name = \"PRO_PLAN\" AND user_subscriptions.user_uuid = users.uuid ); \
" 2>/dev/null |

# Read through the piped result until it's empty.
while IFS='\n' read email; do
    if [[ $email = "0" ]]; then
        echo "No new users registered"
    fi
    if [[ ${email} = "email" ]]; then
        echo "New users found:"
        echo "----------------------------------------"
    else
        # ADD new user with Email $EMAIL a PRO_PLAN subscription
        echo "[$(date -Iseconds)] User: $email added to the PRO_PLAN subscription."
        mysql --password=$DB_PASSWORD --database=$DB_DATABASE -e \
                "INSERT INTO user_roles (role_uuid , user_uuid) VALUES ((SELECT uuid FROM roles WHERE name=\"PRO_USER\" ORDER BY version DESC limit 1) ,(SELECT uuid FROM users WHERE email=\"$email\")) ON DUPLICATE KEY UPDATE role_uuid = VALUES(role_uuid);"
        mysql --password=$DB_PASSWORD --database=$DB_DATABASE -e \
                "INSERT INTO user_subscriptions SET uuid=UUID(), plan_name=\"PRO_PLAN\", ends_at=8640000000000000, created_at=0, updated_at=0, user_uuid=(SELECT uuid FROM users WHERE email=\"$email\"), subscription_id=1, subscription_type=\"regular\";"

        # Add new user Files space. Size is 1GB*$FILES_SIZE
        echo "[$(date -Iseconds)] User: $email added $FILES_SIZE MB of file spcae."
        mysql --password=$DB_PASSWORD --database=$DB_DATABASE -e \
                "INSERT INTO subscription_settings(uuid, name, value, created_at, updated_at, user_subscription_uuid) VALUES (UUID(), \"FILE_UPLOAD_BYTES_LIMIT\", \"$FILE_UPLOAD_BYTES_LIMIT\", FLOOR(UNIX_TIMESTAMP(NOW(6))*1000000), FLOOR(UNIX_TIMESTAMP(NOW(6))*1000000), (SELECT us.uuid FROM user_subscriptions us INNER JOIN users u ON us.user_uuid=u.uuid WHERE u.email=\"$email\"));"
    fi
done
