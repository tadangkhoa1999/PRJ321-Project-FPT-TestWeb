<%-- 
    Document   : addClass
    Created on : Nov 11, 2019, 10:39:10 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <form action="ClassController">
            <table>
                <tr><td>Class name</td> <td><input type="text" name="className" value="" /></td></tr>
                <tr><td>Class Content</td> <td><textarea name="classContent" rows="4" cols="40" ></textarea></td></tr>
            </table>
            <p><input type="submit" value="Add Class" name="action" /></p>
        </form>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
