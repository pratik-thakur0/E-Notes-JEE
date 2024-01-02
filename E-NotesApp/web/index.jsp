<%-- 
    Document   : index
    Created on : 12 May, 2023, 5:33:27 PM
    Author     : pratik
--%>

<%@page import="com.enotes.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            .back-img{
                background: url("img/bg-img.jpg");
                width: 100%;
                height: 85vh;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
        
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <title>HomePage</title>
        <%@include file="all_component/all_css.jsp" %>
    </head>
    <body>
        <!--navbar-->
        <%@include file="all_component/navbar.jsp" %>
        
        <%
            Connection con = DBConnection.getConnection();
            System.out.println(con);
        %>
        
        <div class="container-fluid back-img" style="padding-top:80px">
            <div class="text-center">
                <h1 style="font:italic">E-Notes : Save Your Notes</h1>
                <a href="login.jsp" class="btn btn-light">Login</a>
                <a href="register.jsp" class="btn btn-light">Register</a>
            </div>
        </div>
        
        
        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
