<%-- Document : profile Created on : Nov 14, 2023, 8:36:02 AM Author : HP ADMIN --%>

<%@page import="controller.FollowingController"%>
<%@page import="model.Account"%>
<%@page import="controller.AccountController"%>
<%@page import="controller.CommentController"%>
<%@page import="model.Post"%>
<%@page import="java.util.List"%>
<%@page import="controller.PostController"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
              crossorigin="anonymous">
        <link href="./resources/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link href="./resources/css/newFeed.css" rel="stylesheet">
        <link href="./resources/css/themify-icons/themify-icons.css" rel="stylesheet"/>
        <link href="./resources/css/profile.css" rel="stylesheet">

        <title>Profile</title>
    </head>

    <body>
        <jsp:include page="navbar.jsp" />

        <%
            if (session.getAttribute("account") == null) {
                out.print("<h1 class=\"title-session\">Please login</h1>");
                return;
            }
        %>

        <%
            int accId = Integer.parseInt(request.getParameter("accID"));
            PostController postCtrl = new PostController();
            AccountController accCtrl = new AccountController();
            CommentController cmtCtrl = new CommentController();
            FollowingController followCtrl = new FollowingController();
            List<Post> posts = postCtrl.getPosts(accId);
            Account acc = accCtrl.getAccountByID(accId);

        %>
        <div class="row margin-header">
            <div class="col-2"></div>
            <div class="col-8 profile-container">
                <div class="row">
                    <div class="col-4">
                        <% out.print("<img class=\" imgfirst-child\" src=\"./resources/img/" + acc.getImage() + "\" alt=\"rounded mx-auto d-block\" width=\"150\">"); %>
                        <h2><% out.print(acc.getUsername()); %></h2>
                    </div>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-3">
                                <h4>Posts</h4>
                                <p><% out.print(posts.size()); %></p>
                            </div>
                            <div class="col-5">
                                <h4>Following</h4>
                                <p><% out.print(followCtrl.getFollowing(accId).size()); %></p>
                            </div>
                            <div class="col-4">
                                <h4>Follower</h4>
                                <p><% out.print(followCtrl.getFollower(accId).size()); %></p>
                            </div>
                        </div>

                        <div class="row">
                            <h3><% out.print(acc.getBio()); %></h3>
                        </div>
                    </div>

                </div>
                <div class="text-center">
                    <h3 class="imagehead">Image</h3>
                    <div class="row row-cols-3">
                        <%
                            for (Post post : posts) {
                                if(post.getImage().isEmpty()){
                                    
                                } else{
                                    out.print("<div class=\"col\">");
                                    out.print("<img src=\"./resources/img/" + post.getImage() + "\" alt=\"rounded mx-auto d-block\" width=\"150\">");
                                    out.print("</div>");
                                }
                            }
                            out.print("<div class=\"col\">");
                            out.print("<img src=\"./resources/img/" + acc.getImage() + "\" alt=\"rounded mx-auto d-block\" width=\"150\">");
                            out.print("</div>");

                        %>
                    </div>
                </div>
            </div>
            <div class="col-2"></div>

        </div>
        <div class="row">

            <div class="col-2"></div>

            <div class="col-8">
                <%                    if (posts.isEmpty()) {
                        out.print("<h1 class=\"container\">No post</h1>");
                    } else {
                        for (Post post : posts) {
                            out.println("<div class=\"container postcontainer\">");

                            out.println("<div class=\"card-header d-flex justify-content-between align-items-center\">");

                            out.println("<div class=\"col-md-1\">");
                            out.println("<img src=\"./resources/img/" + acc.getImage() + "\" alt=\"User Profile\" class=\"profile-pic me-2 pic\">");
                            out.println("</div>");
                            out.println("<div class=\"col-md-10\">");
                            out.println("<h5 class=\"fw-bold\">" + acc.getUsername() + "</h5>");
                            out.println("<small class=\"text-muted\">" + post.getDate() + "</small>");
                            out.println("</div>");

                            out.println("</div>");

                            out.println("<div class=\"row\">");
                            out.println("<div class=\"col-md-12 post-content\">");
                            out.println("<div class=\"post-container\">");
                            out.println("<p class=\"post-content\">" + post.getCaption() + "</p>");
                            if(post.getImage().isEmpty()){
                                
                            } else{
                                out.println("<img src=\"./resources/img/" + post.getImage() + "\" alt=\"Posted Image\" class=\"img-fluid postimage\" width = \"400\" height = \"400\">");
                            }
                            out.println("</div>");
                            out.println("</div>");
                            out.println("<p class=\"post-content\">" + cmtCtrl.countCmt(post.getPostID()) + " Comment</p>");
                            out.println("</div>");

                            out.println("<div class=\"row\">");
                            out.println("<div class=\"col-md-12\">");
                            out.println("<div class=\"d-flex justify-content-between\">");
                            out.println("<div class=\"like-comment-share blueText\">");
                            out.println("<i class=\"far ti-thumb-up\"></i> Like");
                            out.println("</div>");
                            out.println("<div class=\"like-comment-share\">");
                            out.println("<a class = \"text-comment\" href = \"comment.jsp?postID=" + post.getPostID() + "\">Comment</a>");
                            out.println("</div>");
                            out.println("<div class=\"like-comment-share blueText\">");
                            out.println("<i class=\"far ti-sharethis\"></i> Share");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");

                            out.println("</div>");
                        }

                    }
                %>
            </div>
            <div class="col-2"></div>

        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </body>

</html>