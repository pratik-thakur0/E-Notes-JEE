/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.enotes.servlets;

import com.enotes.dao.PostDAO;
import com.enotes.db.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pratik
 */
@WebServlet(name = "EditNotesServlet", urlPatterns = {"/EditNotesServlet"})
public class EditNotesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            Integer noteId = Integer.parseInt(request.getParameter("note-id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            
            PostDAO dao = new PostDAO(DBConnection.getConnection());
            boolean f = dao.postUpdate(noteId, title, content);
            
            if(f){
                System.out.println("(Post)Data Updated");
                response.sendRedirect("show-notes.jsp");
            }else System.out.println("(Post) Update Failed");
            
        } catch (Exception e) {
        }
        
        
    }
}
