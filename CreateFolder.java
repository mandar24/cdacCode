package createFolder;
import static com.google.drive.utils.Constants.gdPath;
import static com.google.drive.utils.Constants.home;
import com.google.drive.utils.FileUtility;
import java.io.File;
import javax.annotation.PostConstruct;

public class CreateFolder {

    private  String username;
    private String destination = "C:/Users/MANDAR/Google Drive"; // main location for uploads
    
    public  static void main(String[] args) {
    }

  /*  public  void code() {
        //System.out.println("called get username");
        //username ="abc";
        CreateFolder folder=new CreateFolder();
        folder.getDirectory("username", "destination");
        
    }*/


    public File getDirectory(String destination1, String username1) {
        System.out.println("called get directory");
        
        File directory = new File(destination, username);
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
        return directory;
    }
}