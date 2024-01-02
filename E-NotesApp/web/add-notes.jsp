<%-- 
    Document   : add-notes
    Created on : 20 May, 2023, 12:09:20 PM
    Author     : pratik
--%>

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
        <title>Add Notes</title>
        <%@include file="all_component/all_css.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid">
             
            <h1 class="text-center">Add Your Notes</h1>
            
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <form action="AddNotesServlet" method="post">
                            
                        <div class="form-group">
                            
                            <%
                                UserDetails us = (UserDetails) session.getAttribute("userDetails");
                                if(us != null){%>
                                 <input type="hidden" value="<%=us.getId()%>" name="uid">   
                                <%}
                                
                            %>
                            
                          <label for="exampleInputEmail1">Enter Title</label>
                          <input type="text" class="form-control" name="title" required="required" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter title">

                        </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Content</label>
                                <textarea rows="7" class="form-control" name="content" required="required" placeholder="Enter content">

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
