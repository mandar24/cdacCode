
package com.controller;

import com.google.drive.utils.Constants;
import com.model.UploadFileActionForm;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;


public class UploadFileAction extends org.apache.struts.action.Action {

    public ArrayList<String> records = new ArrayList<String>();
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        UploadFileActionForm actionform = (UploadFileActionForm) form;
        if (actionform.getSubmit().equals("upload")) {
            String username = (String) request.getSession().getAttribute("USER");
            FormFile formfile = actionform.getFile();
            System.out.println("formfile= " + formfile);

                
            File myFile = new File(formfile.getFileName());

            System.out.println("myFile = " + myFile);

            String searchImage = formfile.getFileName();
            System.out.println("searchImage = " + searchImage);

            String upload1 = "/upload";
            String imageDatabase = request.getServletContext().getRealPath(upload1);
            System.out.println("imageDatabase = " + imageDatabase);

            String path = Constants.gdPath + "\\" + username;
            System.out.println("path = " + path);

            String newUploadedImagePath = path + "\\" + searchImage;
            System.out.println("New Path = " + newUploadedImagePath);

            File fileNewPath = new File(newUploadedImagePath);
            File folder = new File(imageDatabase);
            if (!folder.exists()) {
                folder.mkdir();
            }
         

            if (!("").equals(searchImage)) {

                System.out.println("Server path:" + imageDatabase);
                File newFile1 = new File(newUploadedImagePath);

                if (!newFile1.exists()) {
                    FileOutputStream fos = new FileOutputStream(newFile1);
                    fos.write(formfile.getFileData());
                    fos.flush();
                    fos.close();
                }



                FileUtils.copyFileToDirectory(fileNewPath, folder);
               
                request.setAttribute("Message","File Uploaded Successfully");
                return mapping.findForward("fileupload");
            }
        }
        return mapping.findForward(SUCCESS);
    }
}
