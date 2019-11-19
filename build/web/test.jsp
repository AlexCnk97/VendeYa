<%-- 
    Document   : test
    Created on : 10-04-2019, 10:41:21 AM
    Author     : cnk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>JSP Page</title>
        <meta charset="utf-8">
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String[] part = request.getParameterValues("fotos[]");
            
            
        %>
        <%=part[1]%>
    </body>
</html>
