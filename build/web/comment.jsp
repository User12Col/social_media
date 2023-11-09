<%-- 
    Document   : comment
    Created on : Oct 26, 2023, 8:47:40 AM
    Author     : HP ADMIN
--%>

<%@page import="model.Comment"%>
<%@page import="java.util.List"%>
<%@page import="controller.CommentController"%>
<%@page import="controller.AccountController"%>
<%@page import="model.Post"%>
<%@page import="controller.PostController"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="./resources/css/style.css" rel="stylesheet">
        <title>Comment</title>
    </head>
    <body>
        <nav class="navbar fixed-top navbar-expand-lg bg-body-tertiary" data-bs-theme="light">
            <div class="container-fluid">
                <a class="navbar-brand" href="newfeed.jsp"><img src="./resources/img/Instagram_logo.png" width="120" height="50"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="newfeed.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="addpost.jsp">Add Post</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="friend.jsp">Friend</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="editprofile.jsp">Edit Profile</a>
                        </li>
                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Looking for someone..." aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
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

        <div class="container">
            <!-- Post Section -->
            <div class="card mb-3">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <div>
                        <%
                            int postID = Integer.parseInt(request.getParameter("postID"));
                            HttpSession postSession = request.getSession(true);
                            postSession.setAttribute("postID", postID);
                            PostController postCtrl = new PostController();
                            AccountController accCtrl = new AccountController();
                            Post post = postCtrl.getPostByID(postID);
                            Account account = accCtrl.getAccountByID(post.getAccID());
                            out.print("<img src=\"./resources/img/" + account.getImage() + "\" alt=\"Profile Picture\" class=\"profile-pic me-2\">");
                            out.print("<span class=\"fw-bold\">" + account.getUsername() + "</span>");
                        %>

                    </div>
                    <div>
                        <%
                            out.print("<small class=\"text-muted\">" + post.getDate() + "</small>");
                        %>
                    </div>
                </div>
                <div class="card-body">
                    <%
                        out.print("<p class=\"card-text\">" + post.getCaption() + "</p>");
                        out.println("<img src=\"./resources/img/" + post.getImage() + "\" alt=\"Posted Image\" class=\"img-fluid\" width = \"400\" height = \"400\">");
                    %>
                </div>
            </div>
            <form class="input-group mb-3" method="post" action="CommentServlet">
                <input type="text" class="form-control" name="cmtcontent" placeholder="Write a comment">
                <button class="btn btn-primary" type="submit">Post</button>
            </form>
            <!-- Comment Section -->
            <div class="card mb-3">
                <div class="card-body comment-section">

                    <%
                        CommentController cmtCtrl = new CommentController();
                        List<Comment> cmts = cmtCtrl.getCommentOfPost(postID);
                        if(cmts.isEmpty()){
                            out.print("<h1>No comment in this post</h1>");
                        } else{
                            for(Comment cmt : cmts){
                                Account accCmt = accCtrl.getAccountByID(cmt.getAccID());
                                out.print("<div class=\"media mb-3\">");
                                out.print("<img src=\"./resources/img/"+accCmt.getImage()+"\" alt=\"Profile Picture\" class=\"profile-pic me-2\">");
                                out.print("<span class=\"fw-bold\">"+accCmt.getUsername()+"</span>");
                                out.print("<div class=\"media-body\">");
                                out.print("<p>"+cmt.getContent()+"</p>");
                                out.print("</div>");
                                out.print("</div>");
                            }
                        }
                    
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
