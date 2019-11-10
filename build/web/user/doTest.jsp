<%-- 
    Document   : test
    Created on : Oct 19, 2019, 1:38:37 PM
    Author     : dell
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Do Test</title>
    </head>
    <style>
        .button3 {
            width: 80px;
            height: 35px;
            font-size: 16px;
            border-radius: 3px;
        }
    </style>
    <%int count = 0;%>
    <body >
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <c:if test="${not empty listQuestion}">
            <form action="DoTestController">
                <h1 align="center">Question</h1>
                <table border="1">
                 
                    <c:forEach var="x" items="${listQuestion}">
                        
                        <tr>
                            <td style="width: 60%"><%=++count%>, ${x.questionContent}</td><td style="width: 40%">
                                <p><input type="radio" name="${x.questionID}" value="1">A. ${x.opt1}</p>
                                <p><input type="radio" name="${x.questionID}" value="2">B. ${x.opt2}</p>
                                <p><input type="radio" name="${x.questionID}" value="3">C. ${x.opt3}</p>
                                <p><input type="radio" name="${x.questionID}" value="4">D. ${x.opt4}</p>
                            </td>
                        </tr>
                    </c:forEach>

                </table>
                <h1 align="center"><input class="button3" type="submit" value="Submit" name="submit" /></h1>
            </form>
        </c:if>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
