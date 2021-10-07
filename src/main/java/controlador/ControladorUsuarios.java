/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.LogicaUsuarios;
import logica.Usuario;

/**
 *
 * @author USUARIO
 */
public class ControladorUsuarios extends HttpServlet {

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
        
        request.setCharacterEncoding("UTF-8");
        String pagFormulario = "usuarios_form.jsp";
        String pagLista = "usuarios_lista.jsp";
        
        String accion = request.getParameter("accion") + "";
        int id = request.getParameter("id")==null ? 0 : Integer.parseInt(request.getParameter("id"));
        
        switch (accion) {
            case "nuevo":
            case "editar":
                request.setAttribute("id", id);
                request.setAttribute("accion", accion);
                request.getRequestDispatcher(pagFormulario).forward(request, response);
                break;
                
            case "guardar":
                id = Integer.parseInt(request.getParameter("txtId"));
                String nombreCompleto = request.getParameter("txtNombreCompleto");
                String usuario = request.getParameter("txtUsuario");
                String passw = request.getParameter("txtPassw");
                String fechaNacimiento = request.getParameter("dtpFechaNacimiento");
                String parentesco = request.getParameter("txtParentesco");
                String rol = request.getParameter("selRol");
                Usuario u = new Usuario(id, nombreCompleto, usuario, passw, fechaNacimiento, parentesco, rol);
                LogicaUsuarios logica = new LogicaUsuarios();
                boolean guardado = logica.guardarUsuario(u);
                String html;
                if (guardado) {
                    html = "Usuario guardado exitosamente";
                }
                else {
                    html = "Información de usuario no se guardó.";
                }
                html += "<a href=\"usuarios\"><button type=\"submit\" class=\"btn btn-primary\" id=\"btnSubmit\">Volver a la lista</button></a>";
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println(html);
                break;
                
            default:
                request.getRequestDispatcher(pagLista).forward(request, response);
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
