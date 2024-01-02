<%-- 
    Document   : show-notes
    Created on : 23 May, 2023, 11:17:25 PM
    Author     : pratik
--%>

<%@page import="java.util.List"%>
<%@page import="com.enotes.user.Post"%>
<%@page import="com.enotes.db.DBConnection"%>
<%@page import="com.enotes.dao.PostDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UserDetails user4 = (UserDetails) session.getAttribute("userDetails");
    
    if(user4 == null){
        response.sendRedirect("login.jsp");
        session.setAttribute("login-error", "Please Login...");
        
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Notes</title>
        <%@include file="all_component/all_css.jsp" %>
    </head>
    <body>
        <!--Navbar-->
        <%@include file="all_component/navbar.jsp" %>
        
        <div class="container">
            <h2>All Notes :</h2>
            
            <div class="row">
            
                <div class="col-md-12">

                    <%
                        if(user4 != null){
                            PostDAO dao = new PostDAO(DBConnection.getConnection());
                            List<Post> post = dao.getData(user4.getId());
                            for(Post po : post){%>

                            <div class="card mt-3">

                                <img src="img/notes.jpg" alt="" class="card-img-top mt-2 mx-auto" style="max-width: 100px;">

                                <div class="card-body p-4">

                                    <h5 class="card-title"><%= po.getTitle()%></h5>
                                    <p><%= po.getContent()%></p>

                                    <p>
                                        <b class="text-success">Published By: <%= user4.getName()%></b><br>
                                        <b class="text-primary"></b>
                                    </p>
                                    
                                    <p>
                                        <b class="text-success">Published On: <%= po.getPdate()%></b><br>
                                        <b class="text-success"></b>
                                    </p>

                                    <div class="container text-center mt-2">
                                        <a href="DeleteNotesServlet?note_id=<%=po.getId()%>" class="btn btn-danger">Delete</a>
                                        <a href="edit-notes.jsp?note_id=<%=po.getId()%>" class="btn btn-primary">Edit</a>
                                    </div>
                                </div>

                            </div> 

                            <%}
                        }
                    %>    

                </div>
            </div>
        </div>
       
        
    </body>
</html>
