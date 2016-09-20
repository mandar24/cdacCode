
package com.controller;

import com.google.drive.utils.Constants;
import com.model.RegisterActionForm;
import java.io.File;
import java.security.*;
import java.sql.*;
import java.util.Random;
import java.util.logging.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class RegisterAction extends org.apache.struts.action.Action {

    Connection conn = null;
    Connection connection = null;
    int id = 0;
    PreparedStatement ps2 = null;
    ResultSet rs = null;
    String email1 = null;
    String vcode = null;
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        RegisterActionForm actionForm = (RegisterActionForm) form;

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

        for (i = 0; i < 1; i++) {
            int index = ranwd.nextInt(smallLeters.length);
            randomPassword1 += smallLeters[index];
        }
        for (i = 0; i < 2; i++) {
            int index = ranwd.nextInt(numbers.length);
            randomPassword2 += numbers[index];
        }
        for (i = 0; i < 1; i++) {
            int index = ranwd.nextInt(capitalLeters.length);
            randomPassword3 += capitalLeters[index];
        }
        for (i = 0; i < 2; i++) {
            int index = ranwd.nextInt(symbol.length);
            randomPassword4 += symbol[index];
        }

        randomPassword = randomPassword1.concat(randomPassword2).concat(randomPassword3).concat(randomPassword4);
        System.out.println("randomPassword = " + randomPassword);

        String fname = request.getParameter("firstname");
        String emailId = request.getParameter("email");

        String gender = request.getParameter("sex");
        String occ = request.getParameter("subject");
        String pno = request.getParameter("phone");
        String uname = request.getParameter("uname");
        String pass = request.getParameter("password");
        String cpass = request.getParameter("confirmpassword");
        String securityQ = request.getParameter("questionSet");
        String securityQset = request.getParameter("text");

        pass = generateCode(pass);
        cpass = generateCode(cpass);
        String driver = "com.mysql.jdbc.Driver";
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost/login", "root", "root");
            System.out.println("Connected to the database in register action");
            PreparedStatement ps1 = connection.prepareStatement("select * from registration where username='" + uname + "'");
            ResultSet rs1 = ps1.executeQuery();

            if (rs1.next()) {
                request.setAttribute("DUPLICATE_NAME", "Username " + uname + " is already exists...");

                return mapping.findForward("registerfail");
            } else {

                PreparedStatement ps = connection.prepareStatement("insert into registration(Name,EmailId,Gender,Occupation,ContactNo,Username,Password,RetypePassword,SecurityQuestionSet,SecurityQuestion,vcode) values(?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, fname);
                ps.setString(2, emailId);
                ps.setString(3, gender);
                ps.setString(4, occ);
                ps.setString(5, pno);
                ps.setString(6, uname);
                ps.setString(7, pass);
                ps.setString(8, cpass);
                ps.setString(9, securityQset);
                ps.setString(10, securityQ);
                ps.setString(11, randomPassword);
                ps.executeUpdate();

                String query = "select Name,EmailId,Gender,Occupation,ContactNo,Username,Password,RetypePassword,vcode,SecurityQuestion from registration where Username='" + uname + "'";
                PreparedStatement ps3 = connection.prepareStatement(query);
                rs = (ResultSet) ps3.executeQuery();
                if (rs.next()) {
                    String name = rs.getString(1);
                    String emailId1 = rs.getString(2);
                    String gender1 = rs.getString(3);
                    String occ1 = rs.getString(4);
                    String contact = rs.getString(5);
                    String username = rs.getString(6);
                    String password = rs.getString(7);
                    String retypePassword = rs.getString(8);
                    String securityQue = rs.getString(9);

                    PreparedStatement ps4 = connection.prepareStatement("insert into login(Username,Password,EmailId,vcode) values(?,?,?,?)");
                    ps4.setString(1, uname);
                    ps4.setString(2, pass);
                    ps4.setString(3, emailId);
                    ps4.setString(4, randomPassword);
                    ps4.executeUpdate();
                }
            }

            String newFolderPath = createFolder(uname);

           
               System.out.println("mail is send");
           

            return mapping.findForward("registerok");
        } catch (SQLException e) {
            System.out.println("e = " + e);
        }

        return mapping.findForward("register");
    }

    private String createFolder(String userName) {
        String newFolder = userName;

        File directory = new File(Constants.gdPath + "\\" + newFolder);
        //check if the location exists
        if (!directory.exists()) {
            //let's try to create it
            try {
                directory.mkdir();
            } catch (SecurityException secEx) {
                //handle the exception
                secEx.printStackTrace(System.out);
                directory = null;
            }
        }
        return directory.getName();
    }

    private boolean isRegistered(String uname) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost/login", "root", "root");

            Statement stmt = connection.createStatement();

            System.out.println("Connected to the database in register action");
            String query = "select * from registartion where Username  = '" + uname + "'";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                return true;
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterAction.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
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
