<%-- 
    Document   : editprofile
    Created on : Oct 19, 2023, 10:52:25 PM
    Author     : HP ADMIN
--%>

<%@page import="model.User"%>
<%@page import="controller.UserController"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="./resources/css/style.css" rel="stylesheet">
        <title>Edit Profile</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <form class="container text-center" method="post" action="UpdateProfileServlet" enctype="multipart/form-data">
            <div class="text-center">
                <% 
                    UserController userCtrl = new UserController();
                    Account acc = (Account) session.getAttribute("account");
                    User user = userCtrl.getUser(acc.getUserID());
                    out.print("<img src=\"./resources/img/" + acc.getImage() + "\" id=\"imageDisplay\" class=\"rounded\" alt=\"avatar\" width=\"200\" height=\"200\">");
                    //<img src="./resources/img/" id="imageDisplay" class="rounded" alt="avatar" width="200" height="200">
                %>
            </div>
            <div class="row justify-content-center">
                <div class="col-6">
                    </br><input class="form-control" id="imageInput" name="image" type="file" value="" ></br>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">Full Name</label></div>
                <div class="col-6"><% out.print("<input type=\"text\" name=\"fullname\" class=\"form-control\" placeholder=\"Enter your full name\" value = \"" + user.getName() + "\">"); %></br></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">Email address</label></div>
                <div class="col-6"><% out.print("<input type=\"email\" name=\"email\" class=\"form-control\" placeholder=\"name@example.com\" value = \""+acc.getEmail()+"\">"); %></br></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">User Name</label></div>
                <div class="col-6"><% out.print("<input type=\"text\" name=\"username\" class=\"form-control\" placeholder=\"Enter your user name\" value = \""+acc.getUsername()+"\">"); %></br></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">Bio</label></div>
                <div class="col-6"><% out.print("<input type=\"text\" name=\"bio\" class=\"form-control\" placeholder=\"Enter your bio\" value = \""+acc.getBio()+"\">"); %></br></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">Date of Birth</label></div>
                <div class="col-6"><% out.print("<input type=\"date\" name=\"dob\" class=\"form-control\" value = \""+user.getDob()+"\">"); %></br></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">Sex</label></div>
                <div class="col-6">
                    <select name="sex" class="form-control">
                        <option value="0" <% if(user.getSex().equals("0")){ out.print("selected"); } %> >Female</option>
                        <option value="1" <% if(user.getSex().equals("1")){ out.print("selected"); } %> >Male</option>
                    </select><br>
                </div>
            </div>
            <!--
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">Password</label></div>
                <div class="col-6"><input type="password" name="password" class="form-control" placeholder="Enter your password"></br></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">Password Again</label></div>
                <div class="col-6"><input type="password" name="cfpassword" class="form-control" placeholder="Enter your password again"></br></div>
            </div>
            -->
            <div class = "row">
                <div class="col"><h3>${message}</h3></br></div>
            </div>
            <div class="row">
                <div class="col"><button type="submit" class="btn btn-primary mb-3">Update Profile</button></div>
            </div>
        </form>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </body>
</html>
