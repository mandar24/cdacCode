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
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Roboto:300">
        <link rel="stylesheet" type="text/css" href="css/common.css">
        <link rel="stylesheet" type="text/css" href="css/registerpage.css">
        <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.9.2.custom.js"></script>
        <script type="text/javascript" src="js/regpage.js"></script>
    </head>
    <body>
        <header>
            <img src="images/cld.png" height="48" width="48">
            <h1>EDSOC Registration Module</h1>
        </header>
        <%
            String dupname=(String)request.getAttribute("DUPLICATE_NAME");
            if(null!=dupname)
            {%>
            <h3 style="margin-top: 0px;margin-left: 580px; color: #ff0000; position: absolute;"> <% out.println(dupname);%></h3>
          <%  }
            
            
            
            %>
        <article>
            <section>
                <div id="reghead"><h4>Register with the App and get your credentials</h4></div>
                <div id="reginfo">
                    <html:form method="post" action="register" styleId="autoform" styleClass="autoform" onsubmit="if (console) {console.log('onSubmit() action called successfully'); };">
                        <table>
                            <tr><td><label><b>Name</b></label></td>
                                <td><input type="text" name="firstname" class="firstname required depends[anotherelement,value]" id="firstname"></td></tr>
                             <tr><td><label><b>Email-id</b></label></td>
                                <td><input type="text"  name="email" class="email required" id="email"></td></tr>
                            <tr><td><label><b>Gender</b></label></td>
                                <td>Male<input type="radio" name="sex" value="male" class="radio required" >
                                Female<input type="radio" name="sex" value="female" class="radio required"></td></tr>
                              <tr>  <td><label><b>Occupation</b></label></td>
                                <td><input type="text" name="subject" class="text required" id="subject2"></td></tr>
                            <tr><td><label><b>Contact no.</b></label></td>
                                <td><input type="text" name="phone" class="phone required" id="phone"></td></tr>
                              <tr><td><label><b>Username</b></label></td>
                                <td><input type="text" name="uname" class="text required" id="subject2"></td></tr>
                            <tr>
                                <td><label><b>Password</b></label></td>
                                <td><input type="password"  name="password" class="password required" id="password"></td></tr>
                              <tr><td><label><b>Retype<br>Password</b></label></td>
                                <td><input type="password" name="confirmpassword" class="confirmpassword required" id=></td>
                            </tr>

                            <tr>
                                <td><label><b>Security Question</b></label></td>
                                <td>
                                    <select name="questionSet"> 
                                        <option>What is your Nick Name?</option>
                                        <option>What is your favorite color ?</option>
                                        <option>What is your favorite game ?</option>
                                    </select>
                                </td>
                                <td><input type="text" name="text" class="text required" id="text" ></td>
                            </tr>
                            
                            <tr><td colspan="4"><input type="submit" name="submit" class="btn" value="Submit" id="sbm">
                                    <input type="reset" class="btn" value="Reset" id="rst"></td></tr>
                        </table>
                    </html:form>



                </div>
            </section>
            <section>
            </section>
        </article>
        <script type="text/javascript" src="js/gvalidator-config.js" defer="defer"></script>
  <script type="text/javascript" src="js/gvalidator_EN.js" defer="defer"></script>
  <script type="text/javascript" src="js/gvalidator-config.js" defer="defer"></script>
  <script type="text/javascript" src="js/gvalidator.js"s defer="defer"></script>
    </body>
</html>