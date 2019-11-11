<%-- 
    Document   : response
    Created on : Nov 3, 2019, 9:47:51 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/login.css"/>
    </head>
    <style>
        .form{
            text-align: center;
            align-items: center;
        }

        .footer{
            position: relative;
        }
        .button3 {
            width: 130px;
            height: 30px;
            font-size: 16px;
            border-radius: 3px;
        }
        .textarea{
            width: 250px;
            height: 300px;
        }
    </style>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <div class="form">
            <div class="container">
                <h3>Response</h3>
                <form action="ResponseController">
                    <div style="width:300px; margin:0 auto;">
                        <table>
                            <tr><td>Title</td> <td><input type="text" name="title" value="" /></td></tr>
                            <tr><td>Response Content</td> <td><textarea class="textarea" name="responseContent" width="10px" rows="4" cols="40" ></textarea></td></tr>
                        </table>
                        <div style="text-align: center">
                            <p><input type="submit" class="button3" value="Send Response" name="action" /></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
