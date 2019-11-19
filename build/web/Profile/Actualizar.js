/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function actualizar(id) {


    switch (id) {
        case 1:
            var opcion = document.getElementById('Actualizar');
            opcion.innerHTML = '';
            $("#titleModal").text("Actualizar Nombre");
            opcion.innerHTML = `
              <div class="modal-body">
              <form>
              <div class="form-group">
                <label for="exampleInputEmail1">Nuevo Nombre :</label>
                <input type="text" class="form-control" id="dataInfo" aria-describedby="emailHelp" placeholder=""> 
              </div>
            </form>
                   
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="EnviarDatosAct(${id})">Guardar Cambios</button>
                    </div>
            </div>
`;
            break;
        case 2:
            var opcion = document.getElementById('Actualizar');
            opcion.innerHTML = '';
            $("#titleModal").text("Actualizar Password");
            opcion.innerHTML = `
            <div class="modal-body">
                       <form>
              <div class="form-group">
                <label for="exampleInputEmail1">Nueva Password :</label>
                <input type="text" class="form-control" id="dataInfo" aria-describedby="emailHelp" placeholder=""> 
              </div>
            </form>
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="EnviarDatosAct(${id})">Guardar Cambios</button>
                    </div>
                </div>
           
`;
            break;
        case 3:
            var opcion = document.getElementById('Actualizar');
            opcion.innerHTML = '';
            $("#titleModal").text("Actualizar Numero");
            opcion.innerHTML = `
             <div class="modal-body">
                       <form>
              <div class="form-group">
                <label for="exampleInputEmail1">Nuevo Numero :</label>
                <input type="text" class="form-control" id="dataInfo" aria-describedby="emailHelp" placeholder=""> 
              </div>
            </form>
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="EnviarDatosAct(${id})">Guardar Cambios</button>
                    </div>
                    </div>
`;
            break;

        default:

            break;
    }

}
///Funcion para enviar datos
function EnviarDatosAct(op) {
    var port = document.getElementById("port").value;
    var Dato = document.getElementById('dataInfo').value;
    var id = document.getElementById("id").value;
    fetch("http://localhost:" + port + "/VendeYa/UpdateUserInfo?op=" + op + "&data=" + Dato + "&id="+id
            ).then(function (res) {
        return res.text();
    }).then(function (data) {
        console.log(data);
        if (data.length>0) {
            location.href = "http://localhost:" + port + "/VendeYa/Profile";
        } else {
            alert("Ha ocurrido un error");
        }
    });


}
