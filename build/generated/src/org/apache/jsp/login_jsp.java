package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Login</title>\r\n");
      out.write("        <!-- Include CSS File Here -->\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/login.css\"/>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <style>\r\n");
      out.write("            .footer{\r\n");
      out.write("                position: relative\r\n");
      out.write("            }\r\n");
      out.write("            .form{\r\n");
      out.write("                align-items: center\r\n");
      out.write("            }\r\n");
      out.write("            .button3 {\r\n");
      out.write("            width: 313px;\r\n");
      out.write("            height: 40px;\r\n");
      out.write("            font-size: 16px;\r\n");
      out.write("            border-radius: 3px;\r\n");
      out.write("            \r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("        </style>\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navigationBar.jsp", out, false);
      out.write("\r\n");
      out.write("        <div class=\"form\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div style=\"width:300px; margin:0 auto;\">\r\n");
      out.write("                <h2>FPT Test Website</h2>\r\n");
      out.write("                <form id=\"form_id\" method=\"post\" name=\"myform\" action=\"LoginController\">\r\n");
      out.write("                    <p><label>User Name :</label>\r\n");
      out.write("                    <input type=\"text\" name=\"username\"/>\r\n");
      out.write("                    <label>Password :</label>\r\n");
      out.write("                    <input type=\"password\" name=\"password\"/>\r\n");
      out.write("                    <p><input type=\"submit\" class=\"button3\" value=\"Login\" name=\"submit\"/>\r\n");
      out.write("                </form>\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        </div>             \r\n");
      out.write("        <div class=\"footer\">\r\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
