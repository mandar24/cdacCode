<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
 <%
            String input = request.getParameter("filename");
            if (input != null) {
                BufferedInputStream filein = null;
                BufferedOutputStream outputs = null;
                try {
                    String contextPath = request.getServletContext().getRealPath("upload");
                    String fileName = "dfg.bmp";
                    File file = new File(contextPath + "/" + input);//specify the file path
                    byte b[] = new byte[2048];
                    int len = 0;
                    filein = new BufferedInputStream(new FileInputStream(file));
                    outputs = new BufferedOutputStream(response.getOutputStream());
                    response.setHeader("Content-Length", "" + file.length());
                    response.setContentType("application/force-download");
                    response.setHeader("Content-Disposition", "attachment;filename=" + input);
                    response.setHeader("Content-Transfer-Encoding", "binary");
                    while ((len = filein.read(b)) > 0) {
                        outputs.write(b, 0, len);
                        outputs.flush();
                    }
                } catch (Exception e) {
                    out.println(e);
                }
            }
        %>