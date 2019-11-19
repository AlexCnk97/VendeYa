/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var imagenes = [null, null, null, null, null, null];
var locationUser = null;
/*Para agregar imagenes*/
$('#img6').click(function () {
    $('#file1').trigger('click');
    $('#file1').on({
        change: function (e) {
            var fr = new FileReader();

            fr.addEventListener("load", function (e) {
                if (e.target.result.substring(0, 10) == "data:image") {

                    document.getElementById('img6').src = e.target.result;
                    imagenes[5] = e.target.result;
                    updateImages();
                } else {
                    $('#myModal').modal('show')
                }
            });


            fr.readAsDataURL(this.files[0])
        }
    });
});

$('#img5').click(function () {
    $('#file2').trigger('click');
    $('#file2').on({
        change: function (e) {
            var fr = new FileReader();

            fr.addEventListener("load", function (e) {
                if (e.target.result.substring(0, 10) == "data:image") {
                    document.getElementById('img5').src = e.target.result;
                    imagenes[4] = e.target.result;
                    updateImages();
                } else {
                    $('#myModal').modal('show')
                }
            });


            fr.readAsDataURL(this.files[0])
        }
    });
});

$('#img4').click(function () {
    $('#file3').trigger('click');
    $('#file3').on({
        change: function (e) {
            var fr = new FileReader();

            fr.addEventListener("load", function (e) {
                if (e.target.result.substring(0, 10) == "data:image") {
                    document.getElementById('img4').src = e.target.result;
                    imagenes[3] = e.target.result;
                    updateImages();
                } else {
                    $('#myModal').modal('show')
                }
            });


            fr.readAsDataURL(this.files[0])
        }
    });
});

$('#img2').click(function () {
    $('#file4').trigger('click');
    $('#file4').change(function () {
        var fr = new FileReader();

        fr.addEventListener("load", function (e) {
            if (e.target.result.substring(0, 10) == "data:image") {
                document.getElementById('img2').src = e.target.result;
                imagenes[1] = e.target.result;
                updateImages();
            } else {
                $('#myModal').modal('show')
            }
        });


        fr.readAsDataURL(this.files[0])
    })
});

$('#img1').click(function () {
    $('#file5').trigger('click');
    $('#file5').on({
        change: function (e) {
            var fr = new FileReader();

            fr.addEventListener("load", function (e) {
                if (e.target.result.substring(0, 10) == "data:image") {
                    document.getElementById('img1').src = e.target.result;
                    imagenes[0] = e.target.result;
                    updateImages();
                } else {
                    $('#myModal').modal('show')
                }
            });


            fr.readAsDataURL(this.files[0])
        }
    });
});

$('#img3').click(function () {
    $('#file6').trigger('click');
    $('#file6').on({
        change: function (e) {
            var fr = new FileReader();
            fr.addEventListener("load", function (e) {
                if (e.target.result.substring(0, 10) == "data:image") {
                    document.getElementById('img3').src = e.target.result;
                    imagenes[2] = e.target.result;
                    updateImages();
                } else {
                    $('#myModal').modal('show')
                }

            });


            fr.readAsDataURL(this.files[0])
        }
    });
});

/*Quitar la imagen*/

$('#btn6').click(function () {
    document.getElementById('img6').src = "https://icon-library.net/images/add-image-icon-png/add-image-icon-png-15.jpg";
    imagenes[5] = null;
    updateImages();
});

$('#btn5').click(function () {
    document.getElementById('img5').src = "https://icon-library.net/images/add-image-icon-png/add-image-icon-png-15.jpg";
    imagenes[4] = null;
    updateImages();
});

$('#btn4').click(function () {
    document.getElementById('img4').src = "https://icon-library.net/images/add-image-icon-png/add-image-icon-png-15.jpg";
    imagenes[3] = null;
    updateImages();
});

$('#btn3').click(function () {
    document.getElementById('img3').src = "https://icon-library.net/images/add-image-icon-png/add-image-icon-png-15.jpg";
    imagenes[2] = null;
    updateImages();
});

$('#btn2').click(function () {
    document.getElementById('img2').src = "https://icon-library.net/images/add-image-icon-png/add-image-icon-png-15.jpg";
    imagenes[1] = null;
    updateImages();
});

$('#btn1').click(function () {
    document.getElementById('img1').src = "https://icon-library.net/images/add-image-icon-png/add-image-icon-png-15.jpg";
    imagenes[0] = null;
    updateImages();
});


function updateImages() {

    for (var i = 0; i < 6; i++) {
        if ((imagenes[0] || imagenes[1] || imagenes[2] || imagenes[3] || imagenes[4] || imagenes[5]) && locationUser.length > 0) {
            $('#publicar').removeClass('btn-secondary');
            $('#publicar').addClass('btn-primary');
            document.getElementById('publicar').removeAttribute('disabled');

        } else {
            $('#publicar').removeClass('btn-primary');
            $('#publicar').addClass('btn-secondary');
            $('#publicar').attr('disabled', 'true');
        }
    }

}
/*Capturar la ubicacion del usuario*/

function showPosition() {
    var map = null
    var geocodeService = L.esri.Geocoding.geocodeService();
    map = L.map('map').fitWorld();
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    map.locate({setView: true, maxZoom: 16});
    function onLocationFound(e) {
        var radius = e.accuracy;
        console.log(e);
        geocodeService.reverse().latlng(e.latlng).run(function (error, result) {
            if (error) {
                return;
            }
            console.log(result);
            L.marker(result.latlng).addTo(map).bindPopup(result.address.City + "," + result.address.Region).openPopup();
            locationUser = result.address.City + "," + result.address.Region;
            updateImages();
        });

        L.circle(e.latlng, radius).addTo(map);
    }

    map.on('locationfound', onLocationFound);
}

/*Validando Datos para continuar (NEXT1)*/
var checkbox = document.getElementById('defaultCheck1');
var inputTitle = document.getElementById('colFormLabelLg');
function CheckAndInputTitle() {
    if (inputTitle.value.length > 0 && checkbox.checked) {
        $('#next1').removeClass('btn-secondary');
        $('#next1').addClass('btn-primary');
        document.getElementById('next1').removeAttribute('disabled');
    } else {
        $('#next1').removeClass('btn-primary');
        $('#next1').addClass('btn-secondary');
        $('#next1').attr('disabled', 'true');
    }
}

/*Validando datos para NEXT2*/
var desc = document.getElementById('desc');
var price = document.getElementById('price');

function DescAndPrice() {
    if (desc.value.length > 0 && price.value > 0) {
        $('#next2').removeClass('btn-secondary');
        $('#next2').addClass('btn-primary');
        document.getElementById('next2').removeAttribute('disabled');
    } else {
        $('#next2').removeClass('btn-primary');
        $('#next2').addClass('btn-secondary');
        $('#next2').attr('disabled', 'true');
    }
}

function addListener(dom, event, func) {
    dom.addEventListener(event, function () {
        func();
    });
}

addListener(price, 'keyup', DescAndPrice);
addListener(desc, 'keyup', DescAndPrice);
addListener(checkbox, 'change', CheckAndInputTitle);
addListener(inputTitle, 'keyup', CheckAndInputTitle);

/*Enviando informacion*/
//$('#publicar').click(function () {
//    fetch(`http://localhost:8080/VendeYa/test.jsp?fotos[]=${imagenes}`
//            ).then(function (res) {
//        return res.text();
//    }).then(function (data) {
//        location.href = `http://localhost:8080/VendeYa/test.jsp?fotos[]=a`;
//    });
//});

/*Capturando categoria*/
var idCategoria = null;
function getInfo(e) {
    var selectDom = document.getElementById("example" + e.id);
    selectDom.addEventListener('change', function () {
        idCategoria = selectDom.value;
        $('#next3').removeClass('btn-secondary');
        $('#next3').addClass('btn-primary');
        document.getElementById('next3').removeAttribute('disabled');
    });
}

/*Firebase*/
// Your web app's Firebase configuration
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

var datas = [];
var dir = "";

$('#publicar').click(function () {
    $('#MessagePost').text("Enviando datos");
    $('#publicando').modal('show');
    dir = generarpass();
    var storage = firebase.storage();
    ///carpeta raiz
    var storageRef = storage.ref();
    var contador=0;
    var contador2=0;
    
    for (var i = 0; i < imagenes.length; i++) {
        if(imagenes[i])
            contador++;
    }
    
    
    ///Ciclo para ingresar las imagenes

    for (var i = 0; i < imagenes.length; i++) {
        ///verificamos si es null o no 
        if (imagenes[i]) {
            // Hijos adentro de la raiz
            let route = dir + "/";
            console.log(route);
            var ref = storageRef.child(route + (i + 1) + ".jpg");
            ref.putString(imagenes[i], 'data_url').then(function (snapshot) {
                console.log('Uploaded a data_url string! ' + i);
                contador2++;
                $('#MessagePost').text("Subiendo fotos...");
                $('#publicando').modal('show');
                if(contador2==contador){
                    EnviarDatos();
                }
            });
        }
    }
    //setInterval(EnviarDatos, 10000);
});

function EnviarDatos() {
    $('#MessagePost').text("Publicando...");
    $('#publicando').modal('show');
    var storage = firebase.storage();
    ///carpeta raiz
    var storageRef = storage.ref();

    // Create a reference under which you want to list
    var listRef = storageRef.child(dir);

// Find all the prefixes and items.
    listRef.listAll().then(function (res) {

        res.items.forEach(function (itemRef) {

            let ur = "https://firebasestorage.googleapis.com/v0/b/fir-test-c8e57.appspot.com/o/" + dir + "/" + itemRef.name + "?alt=media";
            console.log(ur);
            document.getElementById("list").innerHTML += `<li style="text-decoration:none;" id="${ur}"><li>`;

        });
    }).catch(function (error) {
        alert(error);
    });

    setInterval(function () {
        var lis = document.getElementById("imagesURL").getElementsByTagName("li");
        for (let i = 0; i < lis.length; i++) {
            if (lis[i].id.length > 0) {
                datas.push(lis[i].id);
            }

        }

        var Titulo = document.getElementById("colFormLabelLg").value;
        var port = document.getElementById("port").value;

        fetch("http://localhost:" + port + "/VendeYa/PublicarArticulo?titulo=" + Titulo + "&precio=" + price.value + "&descripcion=" +
                desc.value + "&idsubcategoria=" + idCategoria + "&location=" + locationUser + "&dir=" + dir + "&fotos[]=" + datas[0] +
                "&fotos[]=" + datas[1] + "&fotos[]=" + datas[2] + "&fotos[]=" + datas[3] + "&fotos[]=" + datas[4] + "&fotos[]=" + datas[5]).then(function (res) {
            return res.text();
        }).then(function (data) {
            location.href = "http://localhost:" + port + "/VendeYa/Profile/";
        });
    }, 10000);

}










