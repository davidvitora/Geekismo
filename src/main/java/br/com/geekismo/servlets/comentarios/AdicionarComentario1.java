/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geekismo.servlets.comentarios;

import br.com.geekismo.persistencia.entidade.Artigo;
import br.com.geekismo.persistencia.entidade.Usuarios;
import br.com.geekismo.persistencia.jdbc.ComentarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrador
 */
public class AdicionarComentario1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        ComentarioDAO Controlador = new ComentarioDAO();
        HttpSession session = request.getSession();
        Usuarios usu = (Usuarios)session.getAttribute("usuario");
        Artigo art = (Artigo)session.getAttribute("artigo");
        try{
           Controlador.inserirComentario
        (request.getParameter("comentario"),
         usu.getNome(),
         Integer.toString(art.getId()),
         Integer.toString(usu.getId())); 
        }catch(Exception e){
            
        }
        response.sendRedirect("/Geekismo/articlefullmodel.jsp");
 }
}
