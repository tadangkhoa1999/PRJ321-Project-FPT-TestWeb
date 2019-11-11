<%-- 
    Document   : editTest
    Created on : Oct 28, 2019, 3:22:58 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Test</title>
        <link rel="stylesheet" href="css/login.css"/>
    </head>
    <style>
        .form{
            align-items: center
        }

        .footer{
            margin-top: 100px;
            position: relative;
        }
        .button3 {
            width: 100px;
            height: 30px;
            font-size: 16px;
            border-radius: 3px;
        }
    </style>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <div class="form">
            <div class="container">
                <div style="width:300px; margin:0 auto;">
                    <h1 style="text-align: center; margin-top: 80px">Test Info</h1>
                    <form action="TestController">
                        <table>
                            <tr><td>Test name</td> <td><input type="text" name="testName" value="${TestInfo.testName}" /></td></tr>
                            <tr><td>Question Content</td> <td><textarea style="width: 400px; height: 100px" name="testContent" rows="4" cols="40" >${TestInfo.testContent}</textarea></td></tr>
                            <tr><td>Difficulty</td> <td><input type="text" name="difficulty" value="${TestInfo.difficulty}" /></td></tr>
                        </table>
                        <div style="text-align: center">
                        <p><input class="button3" type="submit" value="Save Info" name="action" /></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
