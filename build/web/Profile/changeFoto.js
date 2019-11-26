/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$("#change").click(function () {
    $("#fotoChange").trigger("click");
    $("#fotoChange").on({
        change: function (e) {
            var fr = new FileReader();

            fr.addEventListener("load", function (e) {
                if (e.target.result.substring(0, 10) == "data:image") {

                    document.getElementById('fotoUser').src = e.target.result;
                    var port = document.getElementById("port").value;
                    var id = document.getElementById("idCuenta").value;

                    fetch("http://localhost:" + port + "/VendeYa/ChangeFoto/?base64="+  e.target.result+ "&id="+ id)
                    .then(function (res) {
                        return res.text();
                    }).then(function (data) {
                        location.href = "http://localhost:" + port + "/VendeYa/Profile/";
                    });
                } else {
                    $('#myModal').modal('show')
                }
            });


            fr.readAsDataURL(this.files[0])
        }
    });
});

