/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.enotes.servlets;

import com.enotes.dao.UserDAO;
import com.enotes.db.DBConnection;
import com.enotes.user.UserDetails;
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
 * @author pratik
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        UserDetails us = new UserDetails();
        us.setEmail(email);
        us.setPassword(password);
        
        UserDAO dao = new UserDAO(DBConnection.getConnection());
        UserDetails user = dao.loginUser(us);
        if(user != null){
            HttpSession session = request.getSession();
            session.setAttribute("userDetails", user);
            
            response.sendRedirect("home.jsp");
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("login-failed", "Inavlid Username and Password");
            response.sendRedirect("login.jsp");
        }
                
                
        
    }
    
}
