<%-- 
    Document   : testInfo
    Created on : Oct 27, 2019, 3:07:24 PM
    Author     : BangPC
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

        <c:if test="${not empty TestInfo}">
            <div style="text-align: center">
                <form action="TestController">
                    <p>
                        <h1>${TestInfo.testName}</h1>
                        <br>${TestInfo.testContent}
                        <br><br>Difficulty: ${TestInfo.difficulty}
                        <br><br><input type="submit" value="Edit Info" name="action"/>
                    </p>
                </form>
                <form action="QuestionController">
                    <p>
                        <input type="submit" value="Show Question" name="action" />
                    </p>
                </form>
            </div>
        </c:if>
        <div style="margin-top: 253px">
        <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
