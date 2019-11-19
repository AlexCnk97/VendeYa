/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Articulo.Articulo;
import Categoria.SubCategoria;
import Cuenta.Cuenta;
import Cuenta.CuentaDAO;
import Publicacion.Publicacion;
import Publicacion.publicarArticulo;
import Usuario.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cnk
 */
@WebServlet(name = "PublicarArticulo", urlPatterns = {"/PublicarArticulo"})
public class PublicarArticulo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String[] images = request.getParameterValues("fotos[]");
            ArrayList<String> arrayImages = new ArrayList<>();
            String title = request.getParameter("titulo");
            Double precio = Double.parseDouble(request.getParameter("precio"));
            String descripcion = request.getParameter("descripcion");
            int categoria = Integer.parseInt(request.getParameter("idsubcategoria"));
            String ubicacion = request.getParameter("location");
            String dir = request.getParameter("dir");
            
            
            Articulo ar = new Articulo();
            for(int i=0;i<images.length;i++){
                if(!images[i].equals("undefined")){
                    arrayImages.add(images[i]);
                   
                    System.out.println(images[i]);
                }
            }
            
            ar.setImagesList(arrayImages);
            
            ar.setNombre(title);
            ar.setPrecio(precio);
            SubCategoria su = new SubCategoria();
            su.setIdCat(categoria);
            ar.setSubCategoria(su);
            ar.setDescripcion(descripcion);
            
            
            Publicacion pos = new Publicacion();
            
            HttpSession session=request.getSession(false);
            
            int id = (int) session.getAttribute("idUsuario");
            pos.setArticulo(ar);
            Usuario user = new Usuario();
            user.setIdUsuario(id);
            CuentaDAO ctD = new CuentaDAO();
            Cuenta ct1 = new Cuenta();
            Cuenta ct2 = new Cuenta();
            ct1 = ctD.LeerCuenta(user);
            ct2.setIdCuenta(ct1.getIdCuenta());
            
            pos.setCuenta(ct2);
            pos.setEstado(null);
            pos.setUbicacion(ubicacion);
            
            publicarArticulo pa = new publicarArticulo(pos);
            pa.setDirectorio(dir);
            pa.setArrayListImages(arrayImages);
            pa.CrearArticulo();
            pa.CrearPublicacion();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
