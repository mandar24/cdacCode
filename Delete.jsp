
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
    </head>
    <body>
             <%
             String username = (String) request.getSession().getAttribute("USER");
        String filename=request.getParameter("filename");
         String path = Constants.gdPath + "\\" + username + "\\"+filename;
        
        //String upload = "\\upload";
              //  String path = request.getServletContext().getRealPath(upload);
              //  String videoPath = path + "\\" ;
                //System.out.println("path in video find action "+a.get(i));
                File file = new File(path);
                String fileName1 = file.getName();
                System.out.println("fileName in delete action  = " + fileName1);
                file.delete();
                
                request.setAttribute("Message", "File Deleted Successfully");
          //  response.sendRedirect("http://localhost:8084/GoogleDemo/videoAction.do?TYPE=AUDIO");
            
            %>
        
        <%
            //String username = (String) request.getSession().getAttribute("USER");
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
                       <li><html:link  href="CreateFolder.jsp">Create Folder</html:link></li>
                    <li><html:link  href="UploadFiles.jsp">Upload Files/Folders</html:link></li>
                    <li><html:link action="/videoAction?TYPE=VIDEO">Video Files</html:link></li>
                    <li><html:link action="/videoAction?TYPE=IMAGE">Image Files</html:link></li>
                    <li><html:link action="/videoAction?TYPE=AUDIO">Audio Files</html:link></li>
                    <li><html:link action="/videoAction?TYPE=TEXT">Text Files</html:link></li>
                    </ul>
                </aside>
          
            <section>

                <h1>File Deleted</h1>
            </section>
        </article>
    </body>
</html>