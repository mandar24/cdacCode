
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

                 <html:form styleId="myform"  action="upload" enctype="multipart/form-data">
                    <html:file property="file"  />
                    <html:submit property="submit" value="upload" styleClass="btn"/>
                    <div id="myform_errorloc" class="error_strings" style="color: #FFFFFF;">
                    </div>
                </html:form>
                 
                
                
            <%
            
            String msg=(String)request.getAttribute("Message");
            if(null != msg)
            {   %>
            <h1 style="margin-top:140px;position: absolute;margin-left: 230px;"><%out.println(msg);   %></h1>
         <%   }
            
            %>
                
                
                
                <%
                    //String upload = "\\upload\\";
                    String videodb = request.getServletContext().getRealPath("/")+"upload";
                    System.out.println(videodb);
                     String path = Constants.gdPath + "\\" + username;
                    File file = new File(videodb);
                    File[] listFiles = file.listFiles();
                    System.out.println("listFiles = " + listFiles.length);
                    for (int i = 0; i < listFiles.length; i++) {
                        File file1 = listFiles[i];
                        System.out.println("file1 = " + file1);
                        String b = file1.getPath();
                        System.out.println("name=" + b);
                %> 
                <a href="VideoStream.jsp?filename=<%= b%>" 
                    <%out.println(b + "<br><br>");%></a>
                <%  }
                %>
           
                
               
                    
                    
            </section>
        </article>
    </body>
</html>