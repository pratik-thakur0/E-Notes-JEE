<%-- 
    Document   : login
    Created on : 12 May, 2023, 5:33:51 PM
    Author     : pratik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login User</title>
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
                            <h4>Login User</h4>    
                        </div>
                        
                        <%
                            String msg = (String)session.getAttribute("login-failed");
                            if(msg != null){%>
                                <div class="alert alert-danger" role="alert">
                                    <%=msg%>
                                </div>
                            <%}
                            session.removeAttribute("login-failed");
                        %>
                        
                        <%
                            String withoutLogin = (String) session.getAttribute("login-error");
                            if(withoutLogin != null){%>
                                <div class="alert alert-danger" role="alert">
                                    <%=withoutLogin%>
                                </div>
                            <%}
                            session.removeAttribute("login-error");
                        %>
                        
                        <%
                            String logoutMsg = (String) session.getAttribute("logout-msg");
                            if(logoutMsg != null){%>
                                <div class="alert alert-success" role="alert">
                                    <%=logoutMsg%>
                                </div>
                            <%}
                            session.removeAttribute("logout-msg");
                        %>
                        
                        
                        <div class="card-body">
                            <form action="LoginServlet" method="post">
                            <div class="form-group">
                                <label>Enter Email</label>
                              <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email">
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Enter Password</label>
                              <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <button type="submit"  class="btn btn-primary badge-pill btn-block">Login</button>
                          </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <%--<%@include file="all_component/footer.jsp" %>--%>    
    </body>
</html>
