
package com.model;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class LoginActionForm extends org.apache.struts.action.ActionForm {
    
   private String uname;
   private String password;
   private String button;
   private String vcode;

    public String getVcode() {
        return vcode;
    }

    public void setVcode(String vcode) {
        this.vcode = vcode;
    }
   

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getButton() {
        return button;
    }

    public void setButton(String button) {
        this.button = button;
    }
   
   
}
