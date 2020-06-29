<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

    <head>

        <title>Sending Mail Through JSP</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width">

    </head>

    <body bgcolor="khaki">

        <form action="smssend" method="POST">

            <table>

                <tr><td><b><font color="red">To:

                    </td>

                    <td><b><b><input type="text" name="number"/><br/>

                    </td>

                </tr>

                

                <tr>

                    <td>

                        <b><font color="red">Message Text:

                    </td>

                    <td>

                        <textarea rows="12" cols="80" name="message"></textarea><br/>

                    </td>

                </tr>
                <tr>

                    <td>
<input type="text" name="eid" hidden="true" value="<% out.print(request.getParameter("eid"));  %>">
                       </td>          
                <tr>

                    <td>

                        <input type="submit" value="Send">

                    </td>

                    <td>

                        <input type="reset" value="Reset">

                    </td>

                </tr>

            </table>

        </form>

    </body>

</html>