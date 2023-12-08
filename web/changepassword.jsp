<%-- 
    Document   : changepassword
    Created on : Dec 6, 2023, 9:27:03 PM
    Author     : HP ADMIN
--%>

<%@page import="model.User"%>
<%@page import="model.Account"%>
<%@page import="controller.UserController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="./resources/css/style.css" rel="stylesheet">
        <link href="./resources/css/newFeed.css" rel="stylesheet">
        <link href="./resources/css/themify-icons/themify-icons.css" rel="stylesheet"/> 
        <link href="./resources/css/login.css" rel="stylesheet">
        <link href="./resources/css/editProfile.css" rel="stylesheet">
        <title>Change Password</title>
    </head>
    <body>
        
        <jsp:include page="navbar.jsp"/>
        <%
            if (session.getAttribute("account") == null) {
                out.print("<h1 class=\"title-session\">Please login</h1>");
                return;
            }
        %>

        <form class="container text-center margin-header" method="post" action="ChangePasswordServlet">
            <div class="text-center">
                <h1>Change your password</h1></br>
            </div>
            <div class="row justify-content-center">
                <div class="col-6"><input id="curr-password" type="password" name="currpassword" class="form-control" placeholder="Enter your current password"><small id="currpassword-error" class="text-danger"></small></br></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-6"><input id="new-password" type="password" name="newpassword" class="form-control" placeholder="Enter your new password"><small id="newpassword-error"  class="text-danger"></small></br></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-6"><input id="cf-new-password" type="password" name="cfnewpassword" class="form-control" placeholder="Enter your new password again"><small id="cfnewpassword-error"  class="text-danger"></small></br></div>
            </div>
            <div class = "row">
                <div class="col"><h3>${message}</h3></br></div>
            </div>
            <div class="row">
                <div class="col"><button type="submit" class="btn btn-primary mb-3 btn-search">Change Password</button></div>
            </div>
            <script src="./validate/validateChangePassword.js"></script>
        </form>

        
    </body>
</html>
