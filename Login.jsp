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
        <script type="text/javascript" src="js/login.js"></script>
        
    </head>
    <body>
        <article>
            <section id="first-page">
                <aside>
                    <h1><b>Ensuring Data Security on Cloud</b></h1>
                    <h3><b>An initiative to stop security issues on Cloud</b></h3>
                    <h3><b>FEATURES </b></h3>
                    <ol>
                        <li><b>Flexible GUI</b></li>                       
                        <li><b>Security Ensured...</b></li>
                        <li><b>Scalable</b></li>
                    </ol>
                    <div id="buttongrp">
                        <div class="btn" id="knw">Know More</div>
                        <a href="register.jsp"><div class="btn" id="reg">Register</div></a>
                    </div>
                </aside>
                <div id="formcontainer">
                    <html:form method="post" action="/login" styleId="myform" onsubmit="return validateForm3()">
                        <table id="logintab">
                            <%
                                String message = (String) request.getAttribute("MESSAGE");
                                if (null != message) {
                            %>
                            <tr><td></td>
                                <td style="color: red;"><%= message%></td></tr>
                                <%                                 }
                                %>
                            <tr><td id="username"><label><b>Username</b></label></td>
                                <td><input type="text" name="uname">
                                <div id="error"></div>
                                </td></tr>
                            <tr><td id="password"><label><b>Password</b></label></td>
                                <td><input type="password" name="password">
                                    <div id="error1"></div>
                                </td></tr>
                            
                           
                            
                            <tr><td colspan="2"><input type="checkbox"><label id="check"><b>Keep me Signed in</b></label></br><a href="#" id="  forgot"><b>  Forgot Password?</b></a></td></tr>
                            <tr><td colspan="2" id="buttons"><input type="submit" name="button" value="Login" class="btn" onclick="validateForm3()"><input type="reset" class="btn" value="Reset"></td></tr>
                        </table>
                    </html:form>
                </div>
            </section>
            <section id="second-page">
                <div id="fltleft">
                    <h1>About EDSOC...</h1>
                    <p> It's a cruel world out there. We have to see the security of our our precious 
                        assets with keen eyes and cautious mind. If we get missed with any aspect of securing our assets,  
                        then it adds a pain forever. Same is the case with the World of web. We should trust cautiously and understand the risk
                        of security issues coming our way.We have begun this project to avoid the above risks which hamper the security of our
                        data.
                    </p>
                </div>
                <div id="fltrigt">
                    <h1>Resources</h1>
                    <table>
                        <tr><td><img src="images/cld.png"></td><td>A Cloud Storage</td></tr>
                        <tr><td><img src="images/tpa.jpg"></td><td>Third Party Auditor</td></tr>
                        <tr><td><img src="images/COMODO_Internet_Security_v4_Icon.png"></td><td>Security Provision</td></tr>
                    </table>
                </div>
                <div class="btn" id="bck">Back</div>
            </section>
        </article>
    </body>
</html>
