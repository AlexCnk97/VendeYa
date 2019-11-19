<%-- 
    Document   : form
    Created on : 10-04-2019, 10:39:22 AM
    Author     : cnk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="test.jsp" method="get">
            <input  type="text" name="fotos[]" >
            <input  type="text" name="fotos[]" >
            <input  type="text" name="fotos[]" >
            <input  type="text" name="fotos[]" >
            <input type="submit" value="Send">
        </form>
    </body>
</html>
