
<%@page import="com.google.drive.utils.Constants"%>
<%@page import="java.io.File"%>
<%@page import="com.google.drive.utils.Element"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Ensuring Data Security on Cloud Client Module</title>
        <link rel="shortcut icon" href="images/cloud.ico" type="image/x-icon">  
        <link rel="stylesheet" type="text/css" href="css/common.css">
        <link rel="stylesheet" type="text/css" href="css/cldpg.css">
        <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.9.2.custom.js"></script>
        <script type="text/javascript" src="js/cld.js"></script>
        <script type="text/javascript" src="js/flowplayer-3.2.13.min.js"></script>
    </head>
    <body>
        <%
            String username = (String) request.getSession().getAttribute("USER");
        %>
        <header>
            <img src="images/cld.png" height="48" width="48">
            <h1>Cloud Sector</h1>
            <div id="hed2"><img src="images/user.png" height="40" width="40"></div>
        </header>
        <div id="iop">

            <table>    
                <tr><td><%= username%></td></tr>
                <tr><td><a href="Logout">Sign Out</a></td></tr>
            </table>
        </div>
        <article>
            <aside>
                <ul>
                   <li><html:link  href="CreateFolder.jsp"><b>Create Folder</b></html:link></li>
                    <li><html:link  href="UploadFiles.jsp"><b>Upload Files/Folders</b></html:link></li>
                    <li><html:link action="/videoAction?TYPE=VIDEO"><b>Video Files</b></html:link></li>
                    <li><html:link action="/videoAction?TYPE=IMAGE"><b>Image Files</b></html:link></li>
                    <li><html:link action="/videoAction?TYPE=AUDIO"><b>Audio Files</b></html:link></li>
                    <li><html:link action="/videoAction?TYPE=TEXT"><b>Text Files</b></html:link></li>
                    </ul>
                </aside>
          
            <section>

            <html:form action="createfolder" method="post">
                <table>
                    <tr><td>Please Enter Folder Name</td>
                        <td><html:text property="folname" /></td>
                        <td><html:submit property="submit" value="Create" styleClass="btn"/></td>
                    </tr>
                </table>
            </html:form>
            <%
            String msg=(String)request.getAttribute("Message");
                    if(null!=msg)
                            {%>
                            <h1><%out.println(msg);   %></h1>        
                  <%          }
            
            
            %>
            </section>
        </article>
    </body>
</html>