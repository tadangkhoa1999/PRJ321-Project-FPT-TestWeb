<%-- 
    Document   : leaderboard
    Created on : Nov 8, 2019, 11:02:25 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <table border="1" cellspacing="0">
            <tr>
                <th>Username</th>	<th>Mark</th>
            </tr>
            <c:forEach var="x" items="${listMark}">
                <tr>
                    <td>${x.user.username}</td><td>${x.mark}</td>
                </tr>
            </c:forEach>
        </table>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
