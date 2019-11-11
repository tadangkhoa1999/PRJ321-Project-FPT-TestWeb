<%-- 
    Document   : addTest
    Created on : Oct 28, 2019, 4:31:20 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Test</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <form action="TestController">
            <table>
                <tr><td>Test name</td> <td><input type="text" name="testName" value="" /></td></tr>
                <tr><td>Test Content</td> <td><textarea name="testContent" rows="4" cols="40" ></textarea></td></tr>
                <tr><td>Difficulty</td> <td><input type="text" name="difficulty" value="" /></td></tr>
            </table>
            <p><input type="submit" value="Add Test" name="action" /></p>
        </form>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
