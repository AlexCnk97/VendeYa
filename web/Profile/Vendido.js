/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/*Eliminar un Articulo Vendido*/
function VerOpciones(id) {
    var port = document.getElementById("port").value;
    document.getElementById('ModalVendidos').innerHTML = `

                           <div class="list-group">
                           <a href="#" class="text-center list-group-item list-group-item-action active">
                            Opciones
                           </a>
                           <a href="http://localhost:${port}/VendeYa/EliminarAnuncio?idArticulo=${id}" class="list-group-item list-group-item-action" tabindex="-1">
                           Eliminar Anuncio</a>
                            </div>
                               `;
    $('#Mi-Modal').modal('show');
}

