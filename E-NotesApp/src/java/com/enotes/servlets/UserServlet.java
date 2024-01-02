/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
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
import javax.servlet.http.*;
/**
 *
 * @author pratik
 */

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        String name = request.getParameter("fname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        UserDetails user = new UserDetails();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        
        UserDAO dao = new UserDAO(DBConnection.getConnection());
        boolean f = dao.addUser(user);
//        PrintWriter out = response.getWriter();
        HttpSession session;
        if(f){
            session = request.getSession();
            session.setAttribute("reg-success", "User Successfully Registered.");
            response.sendRedirect("register.jsp");
            
        }
        else{
            session = request.getSession();
            session.setAttribute("reg-failed", "Something Went Wrong.");
            response.sendRedirect("register.jsp");
        }
    }
}
