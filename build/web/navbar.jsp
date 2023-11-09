<%-- 
    Document   : navbar.jsp
    Created on : Nov 7, 2023, 8:19:00 AM
    Author     : HP ADMIN
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar fixed-top navbar-expand-lg bg-body-tertiary" data-bs-theme="light">
            <div class="container-fluid">
                <a class="navbar-brand" href="newfeed.jsp"><img src="./resources/img/Instagram_logo.png" width="120" height="50"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="newfeed.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="addpost.jsp">Add Post</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="editprofile.jsp">Edit Profile</a>
                        </li>
                    </ul>
                    <div id="formSearch" class="d-flex" role="search">
                        <input class="form-control me-2" id="searchInput" type="search" placeholder="Looking for someone..." aria-label="Search">
                        <button class="btn btn-outline-success" onclick="searchUser()">Search</button>
                        <div class="search-results" id="searchResults">
                            <ul></ul>
                        </div>
                    </div>
                    <div class="row text-center">
                        <div class="col-md-2">
                            <%
                                Account acc = (Account) session.getAttribute("account");
                                out.println("<img src=\"./resources/img/" + acc.getImage() + "\" alt=\"User Profile\" class=\"profile-pic\">");
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <script>
            var isOn = false;
            
            // Bắt sự kiện ấn phím Enter trên trường nhập liệu
            document.getElementById("searchInput").addEventListener("keyup", function (event) {
                if (event.key === "Enter") {
                    var inputData = document.getElementById("searchInput").value;
                    window.location.href = "FriendServlet?data="+inputData;
                }
            });

            function searchUser() {
                var searchValue = document.getElementById("searchInput").value;
                $.ajax({
                    type: "POST",
                    url: "SearchServlet",
                    data: {searchValue: searchValue},
                    success: function (data) {
                        displayResults(data);
                    }
                });
            }

            function displayResults(data) {
                var searchResults = document.getElementById("searchResults");
                if (isOn) {
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
                    li.innerText = user.username;
                    ul.appendChild(li);
                });
            }
        </script>
    </body>
</html>
