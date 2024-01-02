<%-- 
    Document   : register
    Created on : 12 May, 2023, 5:34:01 PM
    Author     : pratik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register User</title>
        <%@include file="all_component/all_css.jsp" %>
    </head>
    <body>
          <!--navbar-->
        <%@include file="all_component/navbar.jsp" %>      
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-3">
                        <div class="card-header text-center">
                            <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
                            <h4>Register User</h4> 
                            <%
                                String regMsg = (String)session.getAttribute("reg-success");
                                if(regMsg != null){%>
                                    <div class="alert alert-success" role="alert">
                                        <%=regMsg%> Login<a href="login.jsp">Click Here.</a></div>
                                <%}
                                session.removeAttribute("reg-success");
                            %>
                            
                            <%
                                String failedMsg = (String)session.getAttribute("reg-failed");
                                if(failedMsg != null){%>
                                    <div class="alert alert-danger" role="alert">
                                    <%=failedMsg%></div>
                                <%}
                                session.removeAttribute("reg-failed");
                            %>

                        </div>
                        <div class="card-body">
                            <form action="UserServlet" method="post">
                            <div class="form-group">
                                <label>Enter Full Name</label>
                                <input type="text" name="fname" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Fullname">
                            </div>
                            <div class="form-group">
                                <label>Enter Email</label>
                                <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Enter Password</label>
                              <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
                          </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <%--<%@include file="all_component/footer.jsp" %>--%>
        
    </body>
</html>
