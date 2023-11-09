function checkSignUp() {
    var fullName = document.getElementsByName("fullname").values;
    //var email = document.getElementsByName("email").values;
    var username = document.getElementsByName("username").values;
    var bio = document.getElementsByName("bio").values;
    var password = document.getElementsByName("password").values;
    var cfpassword = document.getElementsByName("cfpassword").values;
    if (fullName.length == 0) {
        alert("Fill in all field");
    }
}



function checkLogin() {
    var email = document.querySelector("#email");
    var password = document.querySelector("#txtpassword");
    var form = document.querySelector("form");
    form.addEventListener("submit", function (e) {
        e.preventDefault();

    });

    //checkEmpty(email);
    checkEmpty(password);
    /*if (checkEmpty(email) || checkEmpty(password)) {
        form.removeEventListener("summit");
    } else {

    }*/

    /*var email = document.getElementsByName("email").values;
    var password = document.getElementsByName("password").values;
    if(email.length == 0){
        alert("Please enter you email");
        
    }*/
}

function showError(input, message) {
    let parent = input.parentElement;
    let small = document.querySelector("small");
    parent.classList.add("error");
    small.innerText = message;
}

function showSuccess(input) {
    let parent = input.parentElement;
    let small = document.querySelector("small");
    parent.classList.remove("error");
    small.innerText = "";
}

function checkEmpty(input) {

    input.value = input.value.trim();
    if (input.value.length == 0) {
        showError(input, "Khong dc de trong");
    } else {
        //showSuccess(input);
    }
}

