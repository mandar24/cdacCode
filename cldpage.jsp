
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URL"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.util.List"%>
<%@page import="com.google.drive.utils.Element" %>
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
                <tr><td><b><%= username%></b></td></tr>
                <tr><td><a href="Logout"><b>Sign Out</b></a></td></tr>
            </table>
        </div>
        <article>
            <aside>
                <ul>
                    <li><html:link  href="CreateFolder.jsp"><b>Create Folder</b></html:link></li>
                    <li><html:link  href="UploadFiles.jsp"><b>Upload Files</b></html:link></li>
                    <li><html:link action="/videoAction?TYPE=VIDEO"><b>Video Files</b></html:link></li>
                    <li><html:link action="/videoAction?TYPE=IMAGE"><b>Image Files</b></html:link></li>
                    <li><html:link action="/videoAction?TYPE=AUDIO"><b>Audio Files</b></html:link></li>
                    <li><html:link action="/videoAction?TYPE=TEXT"><b>Text Files</b></html:link></li>
                    </ul>
                </aside>
            <%

                List<Element> list = null;
                list = (List<Element>) request.getAttribute("VIDEO_LIST");
                if (null != list) {
            %>
            <section>

                <table style="border: solid 2px #8dc63f;margin-left: 200px;padding: 10px">
                    <tr><th>Video Name</th></tr>
                            <%
                                for (Element element : list) {
                            %>
                <!--   <tr style="padding: 10px;"><td ><a href="VideoPlayer.jsp?filename=<%= element.getFileName()%>"><%= element.getFileName()%></a></td> -->
                        <td style="padding-left: 100px;"><a href="Delete.jsp?filename=<%= element.getFileName()%>" style="color: #3300ff">Delete</a></td>
                         <td style="padding-left: 100px;"><a href="TextDown.jsp?filename=<%= element.getFileName()%>" style="color: #3300ff">Download</a></td>
                 </tr>
                            <%     }   %>

                    <%

                        String filename = request.getParameter("filename");
                        System.out.println("path=" + filename);%>

                </table>
            </section>
            <%                } else {
                list = (List<Element>) request.getAttribute("IMAGE_LIST");

                if (null != list) {
            %>
            <section>
                IMAGES
                <table style="border: solid 1px #8dc63f;">
                    <tr><th>Image Name</th></tr>
                            <%
                                for (Element element : list) {
                            %>
                    <tr><td><a href=ImageShow.jsp?filename=<%= element.getFileName()%>"><%= element.getFileName()%></a></td>
                     <td style="padding-left: 100px;"><a href="Delete.jsp?filename=<%= element.getFileName()%>" style="color: #3300ff">Delete</a>
                    <td style="padding-left: 100px;"><a href="TextDown.jsp?filename=<%= element.getFileName()%>" style="color: #3300ff">Download</a></td>
                    </tr>
                            <%
                                    List<String> element1 = new ArrayList<String>();
                                    element1.add(element.getFileName());
                                    int size = element1.size();
                                    System.out.println("size=" + size);
                                    request.setAttribute("imagelist", element1);

                                }%>

                    <%
                       //  List<String> a = (List<String>) request.getAttribute("dupimg");


                    %>



                </table>
            </section>
            <%                } else {
                list = (List<Element>) request.getAttribute("AUDIO_LIST");

                if (null != list) {
            %>
            <section>
                AUDIOS
                <table style="border: solid 1px #8dc63f;">
                    <tr><th>Audio Name</th></tr>
                            <%
                                for (Element element : list) {
                            %>
                    <tr><td><a href="AudioPlayer.jsp?filename=<%= element.getFileName()%>"><%= element.getFileName()%></a></td>
                       <td style="padding-left: 100px;"><a href="Delete.jsp?filename=<%= element.getFileName()%>" style="color: #3300ff">Delete</a>
                    <td style="padding-left: 100px;"><a href="TextDown.jsp?filename=<%= element.getFileName()%>" style="color: #3300ff">Download</a></td>
                    </tr>
                        <%
                            }
                        %>
                </table>
            </section>
            <%                } else {
                list = (List<Element>) request.getAttribute("TEXT_LIST");
                if (null != list) {

            %>
            <section>
                TEXTS
                <table style="border: solid 1px #8dc63f;">
                    <tr><th>Text Name</th></tr>
                            <%                    for (Element element : list) {
                            %>
                    <tr><td><a href="TextDown.jsp?filename=<%= element.getFileName()%>"><%= element.getFileName()%></a></td>
                     <td style="padding-left: 100px;"><a href="Delete.jsp?filename=<%= element.getFileName()%>" style="color: #3300ff">Delete</a>
                     <td style="padding-left: 100px;"><a href="TextDown.jsp?filename=<%= element.getFileName()%>" style="color: #3300ff">Download</a></td>
                    </tr>
                            <%

                      // URL Url= new URL("http://localhost:8084/GoogleDemo/");
                                    // FileUtils.copyURLToFile(Url,element.getFileName() );
                                }
                            %>
                            <%
                                String filename = request.getParameter("filenametxt");
                                System.out.println("txtfilename" + filename);
                                if (null != filename) {
                                    File fileName = new File(filename);
                                    URL Url = new URL("http://localhost:8080/GoogleDemo/");

                                    FileUtils.copyURLToFile(Url, fileName);

                                }


                            %>


                </table>
                            <%
                                
                              String msg=(String)request.getAttribute("Message");
                              if(null!=msg)
                              {
                                  out.println(msg);
                              }
                                
                                
                                %>
                            
            </section>
            <%                        }
                        }
                    }
                }
            %>

        </article>
    </body>
</html>