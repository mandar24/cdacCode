

package com.controller;

import com.google.drive.utils.Constants;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class DeleteAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String username = (String) request.getSession().getAttribute("USER");
        String filename=request.getParameter("filename");
         String path = Constants.gdPath + "\\" + username + "\\"+filename;
       
                File file = new File(path);
                String fileName1 = file.getName();
                System.out.println("fileName in delete action  = " + fileName1);
                file.delete();
           
            return mapping.findForward("filedelete");
        
      
    }
}
