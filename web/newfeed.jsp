<%-- 
    Document   : newfeed
    Created on : Oct 17, 2023, 3:03:40 PM
    Author     : HP ADMIN
--%>

<%@page import="controller.LikeController"%>
<%@page import="controller.AdvertisementController"%>
<%@page import="model.Advertisement"%>
<%@page import="model.Following"%>
<%@page import="controller.FollowingController"%>
<%@page import="controller.CommentController"%>
<%@page import="controller.AccountController"%>
<%@page import="controller.PostController"%>
<%@page import="java.util.List"%>
<%@page import="model.Post"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="./resources/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link href="./resources/css/newFeed.css" rel="stylesheet">
        <link href="./resources/css/themify-icons/themify-icons.css" rel="stylesheet"/>
        <title>New Feed</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <%
            if (session.getAttribute("account") == null) {
                out.print("<h1 class=\"title-session\">Please login</h1>");
                return;
            }
        %>
        <div class="row backGround">
            <div class="col-2 quangcao">
                <h4 class="Friend-header"><i class="ti-shopping-cart-full"></i></h4>
                    <%
                        AdvertisementController adCtrl = new AdvertisementController();
                        List<Advertisement> listAd = adCtrl.getAll();
                        for (Advertisement ad : listAd) {
                            out.println("<div class=\"post-container align-items-center\">");
                            out.println("<p class=\"post-content\">" + ad.getDiscription() + "</p>");
                            out.println("<img src=\"./resources/img/ad_img/" + ad.getImage() + "\" alt=\"Posted Image\" class=\"img-fluid\" width = \"400\" height = \"400\">");
                            out.println("</div>");
                        }

                    %>
            </div>
            <%            //out.println("<div class=\"row\">");
                out.println("<div class=\"col-8 main-col\">");
                Account acc = (Account) session.getAttribute("account");
                PostController postCtrl = new PostController();
                AccountController accCtrl = new AccountController();
                CommentController cmtCtrl = new CommentController();
                LikeController likeCtrl = new LikeController();
                List<Post> posts = postCtrl.getPosts(acc.getAccID());
                List<Post> friendPosts = postCtrl.getPostsFriend(acc.getAccID());
                if (posts.isEmpty()) {
                    //out.print("<div class=\"container\">");
                    out.print("<img class=\"text-center\" src =\"./resources/img/nopost.png\" width = \"800\" height = \"150\">");
                    out.print("<h1 class=\"container\">No post in your account</h1>");
                    //out.print("</div>");
                } else {
                    for (Post post : posts) {
                        out.println("<div class=\"container postcontainer\">");

                        out.println("<div class=\"card-header d-flex justify-content-between align-items-center\">");

                        out.println("<div class=\"col-md-1\">");
                        out.println("<img src=\"./resources/img/" + acc.getImage() + "\" alt=\"User Profile\" class=\"profile-pic me-2 pic\">");
                        out.println("</div>");
                        out.println("<div class=\"col-md-10\">");
                        out.println("<h5 class=\"fw-bold\"><a class =\"username\" href=\"profile.jsp?accID="+acc.getAccID()+"\">" + acc.getUsername() + "</a></h5>");
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
                        out.println("<p class=\"like-comment\" id=\"like-post-"+post.getPostID()+"\">"+likeCtrl.getNumberOfLike(post.getPostID())+" Like</p>");
                        out.println("<p class=\"post-comment\"> " + cmtCtrl.countCmt(post.getPostID()) + " Comment</p>");
                        out.println("</div>");

                        out.println("<div class=\"row\">");
                        out.println("<div class=\"col-md-12\">");
                        out.println("<div class=\"d-flex justify-content-between\">");
                        out.println("<div class=\"like-comment-share blueText\">");
                        if(likeCtrl.isLike(acc.getAccID(), post.getPostID())){
                            out.println("<i id=\"like-post-btn-"+post.getPostID()+"\" onclick=\"likePost("+acc.getAccID()+","+post.getPostID()+")\" class=\"far ti-thumb-up\" >Unlike</i>");
                        } else{
                            out.println("<i id=\"like-post-btn-"+post.getPostID()+"\" onclick=\"likePost("+acc.getAccID()+","+post.getPostID()+")\" class=\"far ti-thumb-up\" >Like</i>");
                        }
                        out.println("</div>");
                        out.println("<div class=\"like-comment-share blueText\">");
                        out.println("<i class=\"far ti-comment\"><a class = \"text-comment\" href = \"comment.jsp?postID=" + post.getPostID() + "\"> Comment</a></i>");
                        out.println("</div>");
                        out.println("<div class=\"like-comment-share blueText\">");
                        out.println("<i class=\"far ti-sharethis\"> Share</i>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("</div>");

                        out.println("</div>");
                    }

                }

                for (Post post : friendPosts) {
                    Account account = accCtrl.getAccountByID(post.getAccID());
                    out.println("<div class=\"container postcontainer\">");

                    out.println("<div class=\"card-header d-flex justify-content-between align-items-center\">");

                    out.println("<div class=\"col-md-1\">");
                    out.println("<img src=\"./resources/img/" + account.getImage() + "\" alt=\"User Profile\" class=\"profile-pic me-2 pic\">");
                    out.println("</div>");
                    out.println("<div class=\"col-md-10\">");
                    out.println("<h5 class=\"fw-bold\"><a class =\"username\" href=\"profile.jsp?accID="+account.getAccID()+"\">" + account.getUsername() + "</a></h5>");
                    out.println("<small class=\"text-muted\">" + post.getDate() + "</small>");
                    out.println("</div>");

                    out.println("</div>");

                    out.println("<div class=\"row\">");
                    out.println("<div class=\"col-md-12 post-content\">");
                    out.println("<div class=\"post-container\">");
                    out.println("<p class=\"post-content\">" + post.getCaption() + "</p>");
                    out.println("<img src=\"./resources/img/" + post.getImage() + "\" alt=\"Posted Image\" class=\"img-fluid postimage\" width = \"400\" height = \"400\">");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("<p class=\"like-comment\" id=\"like-post-"+post.getPostID()+"\">"+likeCtrl.getNumberOfLike(post.getPostID())+" Like</p>");
                    out.println("<p class=\"post-comment\"> " + cmtCtrl.countCmt(post.getPostID()) + " Comment</p>");
                    out.println("</div>");

                    out.println("<div class=\"row\">");
                    out.println("<div class=\"col-md-12\">");
                    out.println("<div class=\"d-flex justify-content-between\">");
                    out.println("<div class=\"like-comment-share blueText\">");
                    if(likeCtrl.isLike(acc.getAccID(), post.getPostID())){
                        out.println("<i id=\"like-post-btn-"+post.getPostID()+"\" onclick=\"likePost("+acc.getAccID()+","+post.getPostID()+")\" class=\"far ti-thumb-up\" >Unlike</i>");
                    } else{
                        out.println("<i id=\"like-post-btn-"+post.getPostID()+"\" onclick=\"likePost("+acc.getAccID()+","+post.getPostID()+")\" class=\"far ti-thumb-up\" >Like</i>");
                    }
                    out.println("</div>");
                    out.println("<div class=\"like-comment-share blueText\">");
                    out.println("<i class=\"far ti-comment\"><a class = \"text-comment\" href = \"comment.jsp?postID=" + post.getPostID() + "\"> Comment</a></i>");
                    out.println("</div>");
                    out.println("<div class=\"like-comment-share blueText\">");
                    out.println("<i class=\"ti-sharethis blueText\"> Share</i>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");

                    out.println("</div>");
                }
                out.println("</div>");
                out.println("<div class=\"col-2\">");
                out.println("<div class=\"Friend\">");
                out.println("<h4 class=\"Friend-header\"><i class=\"ti-stamp blueText\"></i></h4>");

                FollowingController floCtrl = new FollowingController();
                List<Following> list = floCtrl.getFollowing(acc.getAccID());
                if (list.isEmpty()) {
                    //out.print("<p class=\"container\">No friend</p>");
                } else {
                    for (Following fol : list) {
                        Account friend = accCtrl.getAccountByID(fol.getFollowingID());
                        out.println("<div class=\"friend-element\">");
                        out.println("<div class=\"row\">");
                        out.println("<div class=\"col-4\">");
                        out.println("<img src=\"./resources/img/" + friend.getImage() + "\" alt=\"User Profile\" class=\"profile-pic\">");
                        out.println("</div>");
                        out.println("<div class=\"col-4\">");
                        out.println("<h4>" + friend.getUsername() + "</h4>");
                        out.println("</div>");
                        out.println("</div>");
                        out.println("</div>");
                    }
                }

                out.println("</div>");
                out.println("</div>");

            %>

        </div>
            
        <script src="./function/likeFunction.js"></script>
            
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>


    </body>
</html>
