<%-- 
    Document   : index
    Created on : Oct 16, 2023, 9:07:01 PM
    Author     : HP ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700&display=swap" rel="stylesheet">
        <link href="./resources/css/login.css" rel="stylesheet">
        <title>Login</title>
    </head>
    <body>
        <Div class="TitleInsta" width="100%">
            <img src="./resources/img/Instagram_logo.png" alt="logo"  height="150">
        </Div>
        <Div class="ContainerLogin">
            <form class="container text-center" action="LoginServlet" method="post">
                <div class="row justify-content-center">
                    <div class="col-2"><label class="form-label">Email address</label></div>
                    <div class="col-6"><input type="email" id="email" name="email" class="form-control" placeholder="name@example.com"><small id="email-error" class="text-danger"></small></br></div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-2"><label class="form-label">Password</label></div>
                    <div class="col-6"><input type="password" id="password" name="password" class="form-control" placeholder="Enter your password"><small id="password-error" class="text-danger"></small></br></div>
                </div>
                <div class = "row">
                    <div class="col"><h3>${message}</h3></br></div>
                </div>
                <div class="row">
                    <div class="col"><button type="submit" class="btn btn-primary mb-3 btn-login" >Login</button></div>
                </div>
            </form>
        </Div>
        <div class = "container text-center">
            <div class="row justify-content-center">
                <div class="col"><label class="form-label-1">Don't have account? <a href="signup.jsp">Sign up</a></label></div>
            </div>
        </div>
        <div class="row contailogobot">
            <img src="./resources/img/instagram_PNG10.png" alt="logo" width="500px" height="500px" class="logobot">
        </div>
        <script src="./validate/validateLogin.js"></script>
    </body>
</html>
