/*
 * To change this license header, choose License Headers in Project Properties.
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
@WebServlet(name = "UpdateUserInfo", urlPatterns = {"/UpdateUserInfo"})
public class UpdateUserInfo extends HttpServlet {

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
            int opcion = Integer.parseInt(request.getParameter("op"));
            int id = Integer.parseInt(request.getParameter("id"));
            String Data = request.getParameter("data");
            switch (opcion) {
                case 1:
                    Usuario user = new Usuario();
                    CuentaDAO cta = new CuentaDAO();
                    Cuenta cuenta = new Cuenta();
                    
                    user.setNombre(Data);
                    user.setIdUsuario(id);
                    System.out.print(user.getNombre());
                    UsuarioDAO DAO = new UsuarioDAO();
                    
                    DAO.actualizarUsuarioNombre(user);
                    
                    cuenta = cta.LeerCuenta(id);
                    
                    HttpSession session = request.getSession();
                    session.setMaxInactiveInterval(-1);
                    session.setAttribute("usuario", cuenta.getUser().getNombre());
                    session.setAttribute("usuarioObjeto", cuenta.getUser());
                    session.setAttribute("cuentaObjeto", cuenta);
                    session.setAttribute("idUsuario", cuenta.getUser().getIdUsuario());
                    
                    out.println("true");
                    
                    break;
                case 2:
                    Usuario user2 = new Usuario();
                    
                    user2.setPassword(Data);
                    user2.setIdUsuario(id);
                    UsuarioDAO DAO2 = new UsuarioDAO();
                    
                    DAO2.actualizarUsuarioPass(user2);
                    
                    out.println("true");
                    break;
                case 3:
                    Usuario user3 = new Usuario();
                    CuentaDAO cta2 = new CuentaDAO();
                    Cuenta cuenta2 = new Cuenta();
                    
                    user3.setNumero(Data);
                    user3.setIdUsuario(id);
                    UsuarioDAO DAO3 = new UsuarioDAO();
                    
                    DAO3.actualizarUsuarioNumero(user3);
                    
                    cuenta2 = cta2.LeerCuenta(id);
                    
                    HttpSession session2 = request.getSession();
                    session2.setMaxInactiveInterval(-1);
                    session2.setAttribute("usuario", cuenta2.getUser().getNombre());
                    session2.setAttribute("usuarioObjeto", cuenta2.getUser());
                    session2.setAttribute("cuentaObjeto", cuenta2);
                    session2.setAttribute("idUsuario", cuenta2.getUser().getIdUsuario());
                    
                    out.println("true");
                    break;
                default:
                    break;
            }
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
