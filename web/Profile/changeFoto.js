/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var firebaseConfig = {
    apiKey: "AIzaSyDN32C77AHXC_IB4ZiKQ5QxjCYkjJbrxZ8",
    authDomain: "fir-test-c8e57.firebaseapp.com",
    databaseURL: "https://fir-test-c8e57.firebaseio.com",
    projectId: "fir-test-c8e57",
    storageBucket: "fir-test-c8e57.appspot.com",
    messagingSenderId: "913283215184",
    appId: "1:913283215184:web:fc1a4650b95d33d5e2c655"

};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);

var uploaded = false;
var port = document.getElementById("port");
var id = document.getElementById("idUser");
var correo = document.getElementById("correo");





$("#change").click(function () {
    var storage = firebase.storage();
    ///carpeta raiz
    var storageRef = storage.ref();
    $("#fotoChange").trigger("click");
    $("#fotoChange").on({
        change: function (e) {
            var fr = new FileReader();
            

            fr.addEventListener("load", function (e) {
                if (e.target.result.substring(0, 10) == "data:image") {

                    document.getElementById('fotoUser').src = e.target.result;
                    document.getElementById('spinner').style.display = "block";


                    var ref = storageRef.child(correo.value + "/user.jpg");
                    ref.putString(e.target.result, 'data_url').then(function (snapshot) {
                        console.log('Uploaded a data_url string! ');
                        document.getElementById('spinner').style.display = "none";
                        uploaded=true;

                        if (uploaded) {
                            let url = "https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/" + correo.value + "/" + "user.jpg" + "?alt=media";
                            fetch("http://localhost:" + port.value + "/VendeYa/ChangeFoto?base64=" + url + "&id=" + id.value)
                                    .then(function (res) {
                                        return res.text();
                                    }).then(function (data) {
                                
                                console.log(data)
                            });
                        }
                    });


                } else {
                    $('#myModal').modal('show')
                }
            });


            fr.readAsDataURL(this.files[0])
        }
    });
});


