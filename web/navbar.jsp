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
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700&display=swap" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <nav id="nav" class="navbar fixed-top navbar-expand-lg bg-body-tertiary" data-bs-theme="light">
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
                        <li class="nav-item">
                            <a class="nav-link" href="changepassword.jsp">Change Password</a>
                        </li>
                    </ul>
                    <div id="formSearch" class="d-flex navbar-nav me-auto mb-2 mb-lg-0" role="search">
                        <input class="form-control me-2 search" id="searchInput" type="search" placeholder="Looking for someone..." aria-label="Search">
                        <button class="btn btn-outline-success btn-search" onclick="searchUser()">Search</button>
                        <div class="search-results search-resultstop" id="searchResults">
                            <ul></ul>
                        </div>
                    </div>
                    <div class="row text-center profile-login">
                        <div class="col-md-4">
                            <%
                                Account acc = (Account) session.getAttribute("account");
                                if(acc == null){
                                    out.print("<div class=\"col-md-8\"><a class=\"btn btn-logout\" href=\"index.jsp\">Login</a></div>");
                                } else{
                                    out.println("<a class =\"username\" href=\"profile.jsp?accID="+acc.getAccID()+"\"><img src=\"./resources/img/" + acc.getImage() + "\" alt=\"User Profile\" class=\"profile-pic\"></a>");
                                    out.print("</div>");
                                    out.print("<div class=\"col-md-8\"><form method=\"post\" action=\"LogOutSevlet\"><button class=\"btn btn-logout\" type=\"submit\">Log out</button></form></div>");
                                }
                            %>
                        
                        
                    </div>
                </div>
            </div>
        </nav>

        <script src="./function/searchFunction.js"></script>
    </body>
</html>
