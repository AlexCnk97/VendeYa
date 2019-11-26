/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Cuenta.Cuenta;
import Cuenta.CuentaDAO;
import Usuario.Usuario;
import Usuario.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author César
 */
@WebServlet(name = "ChangeFoto", urlPatterns = {"/ChangeFoto"})
public class ChangeFoto extends HttpServlet {

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
            String base64 = request.getParameter("base64");
            int id = Integer.parseInt(request.getParameter("id"));
            out.print("ok");
            CuentaDAO ctD = new CuentaDAO();
            Cuenta ct = new Cuenta();
            ct.setIdCuenta(id);
            ct.setFoto(base64);
            ctD.ActualizarFoto(ct);
            
            Usuario user = new Usuario();
                    CuentaDAO cta = new CuentaDAO();
                    Cuenta cuenta = new Cuenta();
                    
                    
                    user.setIdUsuario(id);
                    System.out.print(user.getNombre());
                    
                    
                    cuenta = cta.LeerCuenta(id);
                    
                    HttpSession session = request.getSession();
                    session.setMaxInactiveInterval(-1);
                    session.setAttribute("usuario", cuenta.getUser().getNombre());
                    session.setAttribute("usuarioObjeto", cuenta.getUser());
                    session.setAttribute("cuentaObjeto", cuenta);
                    session.setAttribute("idUsuario", cuenta.getUser().getIdUsuario());
            
            
            
            out.print("ok");
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
