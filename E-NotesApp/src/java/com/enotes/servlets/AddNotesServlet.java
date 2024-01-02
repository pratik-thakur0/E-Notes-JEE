/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.enotes.servlets;

import com.enotes.dao.PostDAO;
import com.enotes.db.DBConnection;
import com.enotes.user.Post;
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
@WebServlet(name = "AddNotesServlet", urlPatterns = {"/AddNotesServlet"})
public class AddNotesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int uid = Integer.parseInt(request.getParameter("uid"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        PostDAO dao = new PostDAO(DBConnection.getConnection());
        boolean f = dao.addNotes(title, content, uid);
        
        if (f){
            System.out.println("(POST)Data inserted successfully");
            response.sendRedirect("show-notes.jsp");
        }
        else System.out.println("(POST)Data insert failed");
        
    }
}
