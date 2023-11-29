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