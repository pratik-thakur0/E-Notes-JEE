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
@WebServlet(name = "DeleteNotesServlet", urlPatterns = {"/DeleteNotesServlet"})
public class DeleteNotesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Integer noteId = Integer.parseInt(request.getParameter("note_id"));
        PostDAO dao = new PostDAO(DBConnection.getConnection());
        
        boolean f = dao.deleteNotes(noteId);
        
        if(f){
            System.out.println("(Post)Deleted Success");
            response.sendRedirect("show-notes.jsp");
        }
        
    }
}
