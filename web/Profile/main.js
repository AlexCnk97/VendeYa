/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function showOptions(id) {
    var port = document.getElementById("port").value;
    document.getElementById('ModalOptions').innerHTML = `
    
    <div class="list-group">
        <a href="#" class="text-center list-group-item list-group-item-action active">
            Opciones
        </a>
        <a href="http://localhost:${port}/VendeYa/Anuncio?idArticulo=${id}" class="list-group-item list-group-item-action">
            Ver Anuncio completo</a>
        <a href="http://localhost:${port}/VendeYa/MarcarVendido?idArticulo=${id}" class="list-group-item list-group-item-action">
            Marcar como vendido</a>
        <a href="http://localhost:${port}/VendeYa/Chats?id=${id}" class="list-group-item list-group-item-action">
            Ver Chats</a>
        <a href="http://localhost:${port}/VendeYa/EliminarAnuncio?idArticulo=${id}" class="list-group-item list-group-item-action" tabindex="-1">
            Eliminar Anuncio</a>
    </div>
    `;
    $('#OptionModal').modal('show');
}







