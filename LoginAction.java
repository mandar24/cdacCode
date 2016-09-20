
package com.controller;

import com.model.LoginActionForm;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class LoginAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String username = request.getParameter("uname");

        String password = request.getParameter("password");
//        String verCode = request.getParameter("vcode");
        String verCodeAns = request.getParameter("vcodeAns");
//       String securityQ = request.getParameter("securityQuestion");
        String securityQans = request.getParameter("securityQueAns");

            password = generateCode(password);
            

        String driver1 = "com.mysql.jdbc.Driver";

        Class.forName(driver1);
        Connection connection1 = DriverManager.getConnection(
                "jdbc:mysql://localhost/login", "root", "root");
        System.out.println("Connected to the database");
        String query4 = "select SecurityQuestionSet from registration where Username='" + username + "' ";
        Statement stmt2 = connection1.createStatement();
        ResultSet rs2 = stmt2.executeQuery(query4);
        String ans = null;
        if (rs2.next()) {
            ans = rs2.getString(1);
            request.getSession().setAttribute("ANS", ans);
        }
            String driver = "com.mysql.jdbc.Driver";
            try {
                Class.forName(driver);
                Connection connection = DriverManager.getConnection(
                        "jdbc:mysql://localhost/login", "root", "root");
                System.out.println("Connected to the database");
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("Select * from registration where Username='" + username + "' and password='"+password+"'");
                      
                if (rs.next()) 
                {
                    String email=rs.getString(2);
                    request.getSession().setAttribute("USER", username);
                    request.getSession().setAttribute("PASSWORD", password);

                    Random ranwd = new Random();
                    String smallLeters[] = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
                    String numbers[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
                    String capitalLeters[] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
                    String symbol[] = {"!", "@", "#", "$", "&", "*"};
                    int i;
                    String randomPassword = "";
                    String randomPassword1 = "";
                    String randomPassword2 = "";
                    String randomPassword3 = "";
                    String randomPassword4 = "";
                    for (i = 0;i < 1; i++) 
                    {
                        int index = ranwd.nextInt(smallLeters.length);
                        randomPassword1 += smallLeters[index];
                    }
                    for (i = 0;
                            i < 2; i++) {
                        int index = ranwd.nextInt(numbers.length);
                        randomPassword2 += numbers[index];
                    }
                    for (i = 0; i < 1; i++) 
                    {
                        int index = ranwd.nextInt(capitalLeters.length);
                        randomPassword3 += capitalLeters[index];
                    }
                    for (i = 0;i < 2; i++) 
                    {
                        int index = ranwd.nextInt(symbol.length);
                        randomPassword4 += symbol[index];
                    }
                    randomPassword = randomPassword1.concat(randomPassword2).concat(randomPassword3).concat(randomPassword4);

                    System.out.println(
                            "randomPassword = " + randomPassword);

                    request.getSession()
                            .setAttribute("code", randomPassword);

                    String user = "abc@gmail.com";
                    String password1 = "1234";
                    String subject = "Verification code";
                    String[] to ={email};

                    RegiVer.sendFromGMail(user, password1, to, subject, randomPassword);

                    System.out.println("mail is send in login action");



                    return mapping.findForward("VERIFICATION");
                } 
                else 
                {
                    request.setAttribute("MESSAGE", "Incorrect UserName or Password or Verification Code!");
                    return mapping.findForward("login");
                }


            } 
                    catch (SQLException s) {
            }
            return mapping.findForward("VERIFICATION");

        
       
        

    }
     public String generateCode(String pass) {
        try {
            String password = pass;

            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());

            byte byteData[] = md.digest();

            //convert the byte to hex format method 1
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }

            System.out.println("Hex format : " + sb.toString());

            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
        }
        return null;

    }

}
