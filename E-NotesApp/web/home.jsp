<%-- 
    Document   : home
    Created on : 19 May, 2023, 6:52:30 PM
    Author     : pratik
--%>

<%
    UserDetails user3 = (UserDetails) session.getAttribute("userDetails");
    
    if(user3 == null){
        response.sendRedirect("login.jsp");
        session.setAttribute("login-error", "Please Login...");
        
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <%@include file="all_component/all_css.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid">
            
            <div class="card py-5">
                <div class="card-body text-center">
                    <img src="img/notes.jpg" class="img-fluid mx-auto" style="width: 250px" />
                    <h1>START TAKING YOUR NOTES</h1>
                    <a href="add-notes.jsp" class="btn btn-outline-primary">Start Here</a>
                </div>
            </div>
        </div>
        
    <%@include file="all_component/footer.jsp" %>
        
    </body>
</html>
