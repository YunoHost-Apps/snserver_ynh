#!/bin/bash

source /usr/share/yunohost/helpers

#=================================================
# LOAD ENV FILE
#=================================================

if [ ! -f .env ]; then
    set -a
    source "$install_dir/cron.env"
    set +a
fi

FILE_UPLOAD_BYTES_PER_MB=1048576
FILE_UPLOAD_BYTES_LIMIT="$((FILES_SIZE * FILE_UPLOAD_BYTES_PER_MB))"

#=================================================
# ADD SUBSCRIPTION AND FILES SPACE TO ALL USERS
#=================================================

ynh_script_progression --message="Add a subscription and $FILES_SIZE MB of file space to all users without a subscription"

# Searching for new users in the last 10 minutes without a Pro_Plan subscription.
mysql --password="$db_pwd" --database="$db_name" <<< " \
    SELECT email FROM users WHERE NOT EXISTS( SELECT * FROM user_subscriptions WHERE user_subscriptions.plan_name = \"PRO_PLAN\" AND user_subscriptions.user_uuid = users.uuid ); \
" 2>/dev/null | \
while IFS='\n' read email; do
    if [[ ${email} = "email" ]]; then
        ynh_print_info --message="New users found:"
        ynh_print_info --message="----------------------------------------"
    else
        # ADD new user with Email $EMAIL a PRO_PLAN subscription
        ynh_print_info --message="[$(date -Iseconds)] User: $email added to the PRO_PLAN subscription."
        mysql --password="$db_pwd" --database="$db_name" -e \
            "INSERT INTO user_roles (role_uuid , user_uuid) VALUES ((SELECT uuid FROM roles WHERE name=\"PRO_USER\" ORDER BY version DESC limit 1) ,(SELECT uuid FROM users WHERE email=\"$email\")) ON DUPLICATE KEY UPDATE role_uuid = VALUES(role_uuid);"
        mysql --password="$db_pwd" --database="$db_name" -e \
            "INSERT INTO user_subscriptions SET uuid=UUID(), plan_name=\"PRO_PLAN\", ends_at=8640000000000000, created_at=0, updated_at=0, user_uuid=(SELECT uuid FROM users WHERE email=\"$email\"), subscription_id=1, subscription_type=\"regular\";"

        # Add new user Files space. Size is 1GB*$FILES_SIZE
        ynh_print_info --message="[$(date -Iseconds)] User: $email added $FILES_SIZE MB of file spcae."
        mysql --password="$db_pwd" --database="$db_name" -e \
            "INSERT INTO subscription_settings(uuid, name, value, created_at, updated_at, user_subscription_uuid) VALUES (UUID(), \"FILE_UPLOAD_BYTES_LIMIT\", \"$FILE_UPLOAD_BYTES_LIMIT\", FLOOR(UNIX_TIMESTAMP(NOW(6))*1000000), FLOOR(UNIX_TIMESTAMP(NOW(6))*1000000), (SELECT us.uuid FROM user_subscriptions us INNER JOIN users u ON us.user_uuid=u.uuid WHERE u.email=\"$email\"));"
    fi
done

ynh_script_progression --message="Execution completed" --last
