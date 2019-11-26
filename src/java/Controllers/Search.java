/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Articulo.Articulo;
import Articulo.ArticuloDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Arévalo
 */
@WebServlet(name = "Search", urlPatterns = {"/Search"})
public class Search extends HttpServlet {

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
            String query = null;
            int category = 0;
            int page = 0;
            if (!request.getParameter("query").isEmpty()) {
                query = request.getParameter("query");
                ArrayList<Articulo> articulo = new ArrayList<>();
                ArticuloDAO dao = new ArticuloDAO();
                
                articulo = dao.SearchArticulo(query);
                ////Lista de la paginacion
                ArrayList<ArrayList<Articulo>> art = new ArrayList<ArrayList<Articulo>>();
               
                float Tamanio = (float) articulo.size() / 12;
                
                for (int i = 0; i < Tamanio; i++) {
                    for (int j = 0; j < 12 ; j++) {
                        if(articulo.get(j)!=null){
                            System.out.println("item numero = "+ j);
                        }
                       
                    }
                    System.out.println("nueva lista");
                }
                // Double division = Double.parseDouble(Tamanio);
                System.out.println("paginas" + round(Tamanio));
                 request.setAttribute("ArticuloList", articulo);
                RequestDispatcher rdp = request.getRequestDispatcher("/Search/");
                rdp.forward(request, response);
            }
            if (!request.getParameter("category").isEmpty()) {
                category = Integer.parseInt(request.getParameter("category"));
                ArrayList<Articulo> articulo2 = new ArrayList<Articulo>();
                ArticuloDAO dao2 = new ArticuloDAO();
                
                articulo2 = dao2.CategoriasArtic(category);
                
                request.setAttribute("ArticuloList", articulo2);
                RequestDispatcher rdp = request.getRequestDispatcher("/Category/");
                rdp.forward(request, response);
            }
            if (!request.getParameter("page").isEmpty()) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            
        }
    }

    private int round(double d) {
        double dAbs = Math.abs(d);
        int i = (int) dAbs;
        double result = dAbs - (double) i;
        if (result < 0.5) {
            return d < 0 ? -i : i;            
        } else {
            return d < 0 ? -(i + 1) : i + 1;            
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
