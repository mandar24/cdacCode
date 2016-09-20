
package com.model;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;


public class CreateFolderActionForm extends org.apache.struts.action.ActionForm {
    
   private String folname;
   private String submit;

    public String getFolname() {
        return folname;
    }

    
    public void setFolname(String folname) {
        this.folname = folname;
    }

    public String getSubmit() {
        return submit;
    }

    public void setSubmit(String submit) {
        this.submit = submit;
    }
   
   
    
   
}
