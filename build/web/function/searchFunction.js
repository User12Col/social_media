
var searchResults = document.getElementById("searchResults");
searchResults.style.display = "none";

document.getElementById("searchInput").addEventListener("keyup", function (event) {
    var inputData = document.getElementById("searchInput").value;
    if (event.key === "Enter" && inputData!="") {
        window.location.href = "FriendServlet?data=" + inputData;
    }
});

function searchUser() {
    var searchValue = document.getElementById("searchInput").value;
    if(searchValue!=""){
        $.ajax({
            type: "POST",
            url: "SearchServlet",
            data: { searchValue: searchValue },
            success: function (data) {
                displayResults(data);
            }
        });
    }
    
}

function displayResults(data) {
    var isOn = false;
    var searchResults = document.getElementById("searchResults");
    if (!isOn) {
        searchResults.style.display = "block";
        isOn = !isOn;

    } else {
        searchResults.style.display = "none";
        isOn = !isOn;
    }

    var ul = searchResults.querySelector("ul");
    ul.innerHTML = "";
    data.forEach(function (user) {
        var li = document.createElement("li");
        var liElement = document.querySelector("li");
        var img = document.createElement("img");
        var a = document.createElement("a");
        //li.innerText = user.username;
        img.setAttribute("class", "profile-pic");
        img.setAttribute("src", "./resources/img/" + user.image);
        a.setAttribute("href", "profile.jsp?accID=" + user.accID);
        a.innerText = user.username;
        li.appendChild(img);
        li.appendChild(a);
        ul.appendChild(li);
    });
}