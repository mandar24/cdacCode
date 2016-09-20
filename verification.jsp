 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html>
    <head>
        <title>Ensuring Data Security on Cloud Client Module</title>
        <link rel="shortcut icon" href="images/cloud.ico" type="image/x-icon">  
        <link rel="stylesheet" type="text/css" href="css/common.css">
        <link rel="stylesheet" type="text/css" href="css/indexpage.css">
        <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.9.2.custom.js"></script>
        <script type="text/javascript" src="js/homepage.js"></script>
    </head>
    <body>
        <article>
            <section id="first-page">
                <aside>
                    <h1><b>Ensuring Data Security on Cloud<b></h1>
                    <h3><b>An initiative to stop security issues on Cloud</b></h3>
                    <h3><b>Features </b></h3>
                    <ol>
                        <li><b>Flexible GUI</b></li>
                        <li><b>Security Ensured...</b></li>
                        <li><b>Scalable</b></li>
                    </ol>
                    
                </aside>
                <div id="formcontainer">
                     <%
            String username = (String) request.getSession().getAttribute("USER");
            String password = (String) request.getSession().getAttribute("PASSWORD");
            String que = "Nick Name";
            String driver = "com.mysql.jdbc.Driver";

            Class.forName(driver);
            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost/login", "root", "root");
            System.out.println("Connected to the database");
            Statement stmt = connection.createStatement();
            String query4 = "select SecurityQuestion from registration where Username='" + username + "' ";
            Statement stmt2 = connection.createStatement();
            ResultSet rs2 = stmt.executeQuery(query4);
            String question = "";
            if (rs2.next()) {
                //                 question = rs2.getString("SecurityQuestionSet");
                //                System.out.println("Que=" + question);
                que = rs2.getString(1);
                request.getSession().setAttribute("QUE", que);

            }%>

    
        <html:form action="VerificationAction" styleId="Myform" >


            <table>
                <tr>
                <td><b>
                    Verification Code 
                    </b>
                </td> 

                <td>
                    <html:text property="verTxt"  styleId="txt1"/>
                </td>
            </tr>

            <tr>
<!--            <td> 
                <b>
                Security Question :
                </b>
            </td>-->

            <td>
                <b>  
              <%=que%>
                </b>  
            </td>
            <td>
                <html:text property="securityQans" styleId="txt2" />
            </td>
        </tr>

        <tr>
        <td>
            <html:submit property="submit" value="Submit" styleClass="btn" ></html:submit>
            </td>

            <td>
                <input type="submit" value="Back" onclick="history.back()" class="btn"/>
            </td>
        </tr>

    <%
        String message = (String) request.getAttribute("MESSAGE");
        if (null != message) {
    %>
    <tr><td></td>
    <td style="color: red;"><%= message%></td></tr>

</table>
<%}%>
</html:form>
                </div>
            </section>
           
        </article>
    </body>
</html>
