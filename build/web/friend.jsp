<%@page import="controller.AccountController"%>
<%@page import="model.Following"%>
<%@page import="java.util.List"%>
<%@page import="controller.FollowingController"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="./resources/css/style.css" rel="stylesheet">
        <link href="./resources/css/newFeed.css" rel="stylesheet">
        <link href="./resources/css/themify-icons/themify-icons.css" rel="stylesheet"/>
        <link href="./resources/css/Search.css" rel="stylesheet"/>
        <title>Friend</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <%
            if (session.getAttribute("account") == null) {
                out.print("<h1 class=\"title-session\">Please login</h1>");
                return;
            }
        %>
        
        <%
            Account acc = (Account) session.getAttribute("account");
            String searchValue = request.getParameter("data");
            AccountController accCtrl = new AccountController();
            FollowingController followCtrl = new FollowingController();
            List<Account> list = accCtrl.searchAcc(searchValue);
            out.println("<div class=\"container friend-container margin-header\">");
            if (list.isEmpty()) {
                out.print("<h1 class=\"container\">Your friend list is empty</h1>");
            } else {
                for (Account account : list) {
                    int followID = account.getAccID();
                    out.println("<div class=\"search-result\">");
                    out.println("<div class=\"row item-search\">");
                    out.println("<div class=\"col-md-1\">");
                    out.println("<img src=\"./resources/img/" + account.getImage() + "\" alt=\"User Profile\" class=\"profile-pic\">");
                    out.println("</div>");
                    out.println("<div class=\"col-md-8\">");
                    out.println("<h4><a href=\"profile.jsp?accID="+account.getAccID()+"\">" + account.getUsername() + "</a></h4>");
                    out.println("</div>");
                    out.println("<div class=\"col-md-2\">");
                    if (followCtrl.isFollow(acc.getAccID(), followID)) {
                        out.println("<button id=\"follow-btn-"+followID+"\" class=\"btn btn-outline-success btn-search\" onclick=\"followUser(" + acc.getAccID() + "," + followID + ")\">Unfollow</button>");
                    } else {
                        out.println("<button id=\"follow-btn-"+followID+"\" class=\"btn btn-outline-success btn-search\" onclick=\"followUser(" + acc.getAccID() + "," + followID + ")\">Follow</button>");
                    }
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                }
            }
            out.println("</div>");

        %>


        <script>
            function followUser(accID, followID) {
                var button = document.getElementById("follow-btn-"+followID+"");
                var buttonText = button.textContent;
                if (buttonText === "Follow") {
                    $.ajax({
                        type: "POST",
                        url: "FollowServlet",
                        data: {accID: accID, followID: followID},
                        success: function (data) {
                            button.textContent = "Unfollow";
                        }
                    });
                } else if(buttonText === "Unfollow"){
                    $.ajax({
                        type: "POST",
                        url: "UnFollowServlet",
                        data: {accID: accID, followID: followID},
                        success: function (data) {

                            button.textContent = "Follow";
                        }
                    });
                }

            }

        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </body>
</html>
