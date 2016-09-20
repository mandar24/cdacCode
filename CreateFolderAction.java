
package com.controller;

import com.google.drive.utils.Constants;
import com.model.CreateFolderActionForm;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class CreateFolderAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        CreateFolderActionForm actionform=(CreateFolderActionForm)form;
        if(actionform.getSubmit().equals("Create"))
        {
            String folname=actionform.getFolname();
             String username = (String) request.getSession().getAttribute("USER");
         String destination = Constants.gdPath+"\\"+username+"\\"+folname;

        System.out.println("called get username");

        System.out.println("called get directory");
        
        File directory = new File(destination);
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
        request.setAttribute("Message","Folder Created Successfully");
            return mapping.findForward("folcreated");
            
        }
        return mapping.findForward(SUCCESS);
    }
}
