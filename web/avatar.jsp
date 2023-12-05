<%-- 
    Document   : avatar
    Created on : Oct 24, 2023, 10:08:29 AM
    Author     : HP ADMIN
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700&display=swap" rel="stylesheet">
        <link href="./resources/css/login.css" rel="stylesheet">
        <title>Avatar</title>
    </head>
    <body>
        <form class="container text-center" method="post" action="AvatarServlet" enctype="multipart/form-data">
            <img src="./resources/img/Instagram_logo.png" alt="logo" width="300" height="120">
            
            <%
                Account acc = (Account)session.getAttribute("account");
                out.println("<div class=\"text-center\">");
                out.println("<h2>Welcome, "+acc.getUsername()+". Choose your avatar</h2>");
                out.println("</div>");
            %>
            <div class="text-center">
                <img src="./resources/img/user.png" id="imageDisplay" class="rounded" alt="avatar" width="200" height="200">
            </div>
            <div class="row justify-content-center">
                <div class="col-6">
                    </br><input class="form-control" id="imageInput" name="image" type="file"></br>
                </div>
            </div>
            <div class = "row">
                <div class="col"><h3>${message}</h3></br></div>
            </div>
            <div class="row">
                <div class="col"><button type="submit" class="btn btn-primary mb-3">Complete</button></div>
            </div>
        </form>
        
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
