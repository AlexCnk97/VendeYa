var btnSignIn = document.getElementById("register");
var password = document.getElementById("password");
var password2 = document.getElementById("password-confirm");
var contra = "";
password2.addEventListener("keyup", function() {
    contra = password2.value;
    if (contra == password.value) {
        document.getElementById("mensaje").innerHTML = "";
    } else {
        document.getElementById("mensaje").innerHTML = "Las contraseñas no coinciden.";
    }

});

password.addEventListener("keyup",function(){
    contra = password.value;
    if (contra == password2.value) {
        document.getElementById("mensaje").innerHTML = "";
    } else {
        document.getElementById("mensaje").innerHTML = "Las contraseñas no coinciden.";
    }

})






