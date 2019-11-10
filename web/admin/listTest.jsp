<%-- 
    Document   : listTest
    Created on : Oct 20, 2019, 4:12:32 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Test</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <table border="1" cellspacing="0">
            <tr>
                <th>Test Name</th>
                <th></th>
            </tr>
            <c:forEach var="x" items="${testList}">
                <tr>
                    <td><a href="TestController?testID=${x.testID}&action=TestInfo">${x.testName}</a></td>
                    <td>
                        <a href="TestController?testID=${x.testID}&action=leaderboard">Leader board</a>
                    </td>
                    <td align="center">
                        <c:url var="delete" value="TestController">
                            <c:param name="classID" value="${param.classID}"/>
                            <c:param name="testID" value="${x.testID}"/>
                            <c:param name="action" value="delete"/>
                        </c:url>
                        <a href="${delete}" onclick="return confirm('Ban co muon xoa?')">
                            <img src="media/delete.png"/> Delete
                        </a>
                    </td>
                    
                    <td align="center">
                        <c:url var="edit" value="TestController">
                            <c:param name="testID" value="${x.testID}"/>
                            <c:param name="action" value="Edit Info"/>
                        </c:url>
                        <a href="${edit}" onclick="return confirm('Ban co muon sua?')">
                            <img src="media/edit.png"/> Edit Info
                        </a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td align="center">
                    <c:url var="add" value="TestController">
                        <c:param name="classID" value="${param.classID}"/>
                        <c:param name="action" value="add"/>
                    </c:url>
                    <a href="${add}" onclick="return confirm('Ban co muon them?')">
                        <img src="media/add.png"/>
                    </a>
                </td>
            </tr>
        </table>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
