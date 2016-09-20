
package com.model;

import com.google.drive.utils.QueSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;


public class VerificationActionForm extends org.apache.struts.action.ActionForm {
    String verTxt;
    String submit;
    String securityQ;
    String securityQans;

    public String getSecurityQ() {
                           return securityQ;

    }

    public void setSecurityQ(String securityQ) {
        this.securityQ = securityQ;
    }

    public String getSecurityQans() {
        return securityQans;
    }

    public void setSecurityQans(String securityQans) {
        this.securityQans = securityQans;
    }
    

    public String getVerTxt() {
        return verTxt;
    }

    public void setVerTxt(String verTxt) {
        this.verTxt = verTxt;
    }

    public String getSubmit() {
        return submit;
    }

    public void setSubmit(String submit) {
        this.submit = submit;
    }
    
    
}
