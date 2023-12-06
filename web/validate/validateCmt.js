document.querySelector(".cmt-form").addEventListener("submit", validateCmt);

function checkEmpty(input, event, element, message) {
    if (input.trim() === "") {
        element.textContent = message;
        event.preventDefault();
        return false;
    } else {
        element.textContent = "";
    }

}

function validateCmt(event){
    var cmt = document.getElementById("cmt");
    var cmtError = document.getElementById("cmt-error");

    checkEmpty(cmt, event, cmtError, "Write something before comment");

    return true;
}