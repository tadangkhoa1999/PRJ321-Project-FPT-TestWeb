<%-- 
    Document   : test
    Created on : Oct 19, 2019, 10:36:38 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Manipulation</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"></jsp:include>
        <h1 style="text-align: center">Questions Manipulation</h1>
            <table border="1">
                <tr>
                    <th>Question</th>
                    <th></th>
                    <th></th>
                </tr>
            <c:forEach var="x" items="${listQuestion}">
                <tr>
                    <td style="width: 90%">${x.questionContent}
                        <p>A. ${x.opt1}</p>
                        <p>B. ${x.opt2}</p>
                        <p>C. ${x.opt3}</p>
                        <p>D. ${x.opt4}</p>
                        <p>Correct Answer: ${x.rightOption}</p>
                    </td>
                    <td align="center" style="width: 5%">
                        <c:url var="delete" value="QuestionController">
                            <c:param name="testID" value="${param.testID}"/>
                            <c:param name="questionID" value="${x.questionID}"/>
                            <c:param name="action" value="delete"/>
                        </c:url>
                        <a href="${delete}" onclick="return confirm('Ban co muon xoa?')">
                            <img src="media/delete.png"/> Delete
                        </a>
                    </td>
                    <td align="center" style="width: 5%">
                        <c:url var="edit" value="QuestionController">
                            <c:param name="testID" value="${param.testID}"/>
                            <c:param name="questionID" value="${x.questionID}"/>
                            <c:param name="action" value="edit"/>
                        </c:url>
                        <a href="${edit}" onclick="return confirm('Ban co muon sua?')">
                            <img src="media/edit.png"/> Edit
                        </a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td align="center">
                    <c:url var="add" value="QuestionController">
                        <c:param name="testID" value="${param.testID}"/>
                        <c:param name="questionID" value="${x.questionID}"/>
                        <c:param name="action" value="add"/>
                    </c:url>
                    <a href="${add}" onclick="return confirm('Ban co muon them?')">
                        <img src="media/add.png"/>
                    </a>
                </td>
            </tr>
        </table>
        <div style="margin-top: 40px">
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
