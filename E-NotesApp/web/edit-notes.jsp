<%-- 
    Document   : edit-notes
    Created on : 24 May, 2023, 12:40:21 PM
    Author     : pratik
--%>

<%@page import="com.enotes.user.Post"%>
<%@page import="com.enotes.db.DBConnection"%>
<%@page import="com.enotes.dao.PostDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UserDetails user1 = (UserDetails) session.getAttribute("userDetails");
    
    if(user1 == null){
        response.sendRedirect("login.jsp");
        session.setAttribute("login-error", "Please Login...");
        
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Notes</title>
        <%@include file="all_component/all_css.jsp" %>

    </head>
    <body>
        
        <%
            Integer noteId = Integer.parseInt(request.getParameter("note_id"));
            PostDAO dao = new PostDAO(DBConnection.getConnection());
            Post post = dao.getDataById(noteId);
        %>
        
        <!--Navbar-->
        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid">
             
            <h1 class="text-center">Edit Your Notes</h1>
            
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <form action="EditNotesServlet" method="post">
                            
                            <input type="hidden" value="<%=noteId%>" name="note-id">    
                        <div class="form-group">
                            
                          <label for="exampleInputEmail1">Enter Title</label>
                          <input type="text" class="form-control" name="title" value="<%=post.getTitle()%>" required="required" id="exampleInputEmail1" aria-describedby="emailHelp">

                        </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Content</label>
                                <textarea rows="7" class="form-control" name="content" required="required" placeholder="Enter content">
                                    <%=post.getContent()%>
                                </textarea>
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary">Add Note</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>   
        </div>
            
        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
