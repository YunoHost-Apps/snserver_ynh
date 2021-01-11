loadJSON("extensions/index.json");
function loadJSON(file){
    fetch(file)
    .then(function (response) {
        return response.json();
    })
    .then(function (data) {
        appendData(data);
    })
    .catch(function (err) {
        console.log('error: ' + err);
    });
}
function appendData(data) {
    for (var i = 0; i < data.length; i++) {
        var mainContainer = document.getElementById(data[i].extension + "sData");
        var tr = document.createElement("tr");
        tr.innerHTML = 
            "<td id='name'>" + data[i].name + "</td>" +
            "<td id='url'><a href=" + data[i].url + ">" + data[i].url + "</a></td>"
        mainContainer.appendChild(tr);
    }
}
