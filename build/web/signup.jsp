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
        <title>Sign Up</title>
    </head>
    <body>

        <form class="container text-center" method="post" action="SignupServlet">
            <img src="./resources/img/Instagram_logo.png" alt="logo" width="300" height="120">
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">Full Name</label></div>
                <div class="col-6"><input type="text" name="fullname" class="form-control" placeholder="Enter your full name"></br></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">Email address</label></div>
                <div class="col-6"><input type="email" name="email" class="form-control" placeholder="name@example.com"></br></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">User Name</label></div>
                <div class="col-6"><input type="text" name="username" class="form-control" placeholder="Enter your user name"></br></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">Bio</label></div>
                <div class="col-6"><input type="text" name="bio" class="form-control" placeholder="Enter your bio"></br></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">Date of Birth</label></div>
                <div class="col-6"><input type="date" name="dob" class="form-control"></br></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">Sex</label></div>
                <div class="col-6">
                    <select name="sex" class="form-control">
                        <option value="0">Female</option>
                        <option value="1">Male</option>
                    </select><br>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">Password</label></div>
                <div class="col-6"><input type="password" name="password" class="form-control" placeholder="Enter your password"></br></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-2"><label class="form-label">Password Again</label></div>
                <div class="col-6"><input type="password" name="cfpassword" class="form-control" placeholder="Enter your password again"></br></div>
            </div>
            <div class = "row">
                <div class="col"><h3>${message}</h3></br></div>
            </div>
            <div class="row">
                <div class="col"><button type="submit" class="btn btn-primary mb-3" onclick="checkSignUp()">Sign Up</button></div>
            </div>
        </form>

        <script src="./format.js"></script>
        <script>
            // JavaScript code to display the selected image
            const imageInput = document.getElementById("imageInput");
            const imageDisplay = document.getElementById("imageDisplay");

            imageInput.addEventListener("change", function () {
                if (imageInput.files && imageInput.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        imageDisplay.src = e.target.result;
                    };
                    reader.readAsDataURL(imageInput.files[0]);
                }
            });
        </script>
    </body>
</html>
