document.querySelector(".container").addEventListener("submit", validateChangePassword);

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

function checkPasswordLength(input, event, element, message){
    if(input.trim().length < 6){
        element.textContent = message;
        event.preventDefault();
        return false;
    } else{
        element.textContent = "";
    }
}

function checkMatchPassword(password, cfpassword, event, element, message){
    if(password.trim() === cfpassword.trim()){
        element.textContent = "";
    } else{
        element.textContent = message;
        event.preventDefault();
        return false;
    }
}

function validateChangePassword(event) {
    var currPass = document.getElementById("curr-password").value;
    var newPass = document.getElementById("new-password").value;
    var cfNewPass = document.getElementById("cf-new-password").value;

    var currPassError = document.getElementById("currpassword-error");
    var newPassError = document.getElementById("newpassword-error");
    var cfNewPassError = document.getElementById("cfnewpassword-error");
    
    checkEmpty(currPass, event, currPassError, "Password is required");
    checkEmpty(newPass, event, newPassError, "New password is required");
    checkEmpty(cfNewPass, event, cfNewPassError, "New password is required");

    checkPasswordLength(currPass, event, currPassError, "Password must be at least 6 character");
    checkPasswordLength(newPass, event, newPassError, "Password must be at least 6 character");
    checkPasswordLength(cfNewPass, event, cfNewPassError, "Password must be at least 6 character");
    
    checkMatchPassword(newPass, cfNewPass, event, cfNewPassError, "You password doesnt match");

    return true;

}