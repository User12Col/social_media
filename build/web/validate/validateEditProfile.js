document.querySelector(".container").addEventListener("submit", validateEditProfile);

function checkEmpty(input, event, element, message) {
    if (input.trim() === "") {
        element.textContent = message;
        event.preventDefault();
        return false;
    } else {
        element.textContent = "";
    }

}

function checkEmail(input, event, element, message) {
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    if (!emailPattern.test(input.trim())) {
        element.textContent = message;
        event.preventDefault();
        return false;
    } else {
        element.textContent = "";
    }
}

function checkDoB(input, event, element, message){
    var date = new Date();
    var currDay = date.getFullYear() +"-"+date.getMonth() +"-"+date.getDate();
    if(input > currDay){
        element.textContent = message;
        event.preventDefault();
        return false;
    } else {
        element.textContent = "";
    }
}

function validateEditProfile(event) {
    var fullname = document.getElementById("fullname").value;
    var email = document.getElementById("email").value;
    var username = document.getElementById("username").value;
    var bio = document.getElementById("bio").value;
    var dob = document.getElementById("dob").value;

    var fullnameError = document.getElementById("fullname-error");
    var emailError = document.getElementById("email-error");
    var usernameError = document.getElementById("username-error");
    var bioError = document.getElementById("bio-error");
    var dobError = document.getElementById("dob-error");
    
    checkEmpty(fullname, event, fullnameError, "Full name is required\n");
    checkEmpty(email, event, emailError, "Email is required");
    checkEmpty(username, event, usernameError, "User name is required");
    checkEmpty(bio, event, bioError, "Bio is required");
    checkEmpty(dob, event, dobError, "DoB is required");

    checkDoB(dob, event, dobError, "Invalid Day of birth");

    checkEmail(email, event, emailError, "Invalid email");

    return true;

}