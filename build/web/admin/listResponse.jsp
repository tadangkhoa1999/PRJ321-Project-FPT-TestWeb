<%-- 
    Document   : listResponse
    Created on : Nov 3, 2019, 10:57:06 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .form{
            text-align: center;
            align-items: center;
        }
    </style>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <div class="form">
            <h1>List Responses</h1>
            <table border="1" cellspacing="0" align="center">
                <tr>
                    <th>User ID</th><th>Username</th><th>Tittle</th><th>Content</th>
                </tr>
                <c:forEach var="x" items="${listResponse}">
                    <tr>
                        <td>
                            ${x.userID}
                        </td>
                        <td>
                            ${x.username}
                        </td>
                        <td>
                            ${x.title}
                        </td>
                        <td>
                            ${x.responseContent}
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
