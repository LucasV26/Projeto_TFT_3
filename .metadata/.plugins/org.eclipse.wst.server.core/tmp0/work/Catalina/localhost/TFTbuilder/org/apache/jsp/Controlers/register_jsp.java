/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.37
 * Generated at: 2021-01-26 05:28:26 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Controlers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/Controlers/../Views/head.html", Long.valueOf(1610745455443L));
    _jspx_dependants.put("/Controlers/../Views/foot.html", Long.valueOf(1611638818271L));
    _jspx_dependants.put("/Controlers/../Views/registerForm.html", Long.valueOf(1610351467210L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("    \n");
 
	int userID = 0;

	if(session.getAttribute("userLogin") != null){	
		userID = (int) session.getAttribute("userLogin");
	}

      out.write('\n');
      out.write('\n');
      out.write("<html>\n");
      out.write("\n");
      out.write("\t<head>\n");
      out.write("\t\t<meta charset=\"UTF-8\">\n");
      out.write("\t\t<meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("\t\t<meta http-equiv=\"content-type\" content=\"application/xhtml+xml; charset=UTF-8\">\n");
      out.write("\t\t\n");
      out.write("\t\t<link rel=\"shortcut icon\" href=\"../Imagens/Misc/favicon.png\" />\n");
      out.write("\t    <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.11.2/css/all.css\">\n");
      out.write("\t    <link rel=\"stylesheet\" href=\"../MDB/css/mdb.min.css\">\n");
      out.write("\t    <link rel=\"stylesheet\" href=\"../Styles/index.css\">\n");
      out.write("\t    \n");
      out.write("\t\t<title>TFT Builder set-4</title>\n");
      out.write("\t\t\n");
      out.write("\t</head>\n");
      out.write("\t\n");
      out.write("\t<body>\n");
      out.write("\t\t<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\n");
      out.write("\t\t<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js\"></script>\n");
      out.write("\t    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"></script>");
      out.write('\n');
      out.write('	');
 if(userID == 0){ 
      out.write('\n');
      out.write('	');
      out.write('	');
      out.write("<div class=\"w-50 mx-auto mt-5 \">\n");
      out.write("\t<form class=\"text-center border border-warning p-5\" method=\"POST\" id=\"registerForm\">\n");
      out.write("\t\n");
      out.write("\t    <p class=\"h4 mb-4\">Registre-se</p>\n");
      out.write("\t\n");
      out.write("\t\t<input type=\"text\" name=\"nome\" id=\"nome\" class=\"form-control mb-4\" placeholder=\"Nome de Usuario\" maxlength=\"100\">\n");
      out.write("\t\n");
      out.write("\t    <input type=\"email\" name=\"email\" id=\"email\" class=\"form-control mb-4\" placeholder=\"E-mail\" maxlength=\"100\">\n");
      out.write("\t\t\n");
      out.write("\t\t<button type=\"button\" class=\"btn btn-info\" onclick=\"window.history.back()\"> Voltar </button>\n");
      out.write("\t\t<button type=\"button\" class=\"btn btn-info\" id=\"submitForm\"> Cadastrar </button>\n");
      out.write("\t    \n");
      out.write("\t    <div id=\"retorno\" class=\"text-danger\">  </div> \n");
      out.write("\t</form>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("\t$(document).ready( () => {\n");
      out.write("\t\t$(\"#submitForm\").click( () => {\n");
      out.write("\t\t\tvar formData = $(\"#registerForm\").serialize();\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t$.post(\"../Models/registerUser.jsp\", formData, (data, status) => {\n");
      out.write("\t\t\t\tif(data.success){\n");
      out.write("\t\t\t\t\twindow.alert(\"Usuario cadastrado com sucesso! Verifique o email cadastrado\");\n");
      out.write("\t\t\t\t\twindow.location.replace(\"../Controlers/index.jsp\");\n");
      out.write("\t\t\t\t}else{\n");
      out.write("\t\t\t\t\t$(\"#retorno\").html(\"Erro! Preencha todos os campos com dados validos!\");\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t}, \"json\");\n");
      out.write("\t\t\t\n");
      out.write("\t\t});\n");
      out.write("\t\t\n");
      out.write("\t});\n");
      out.write("</script>");
      out.write('\n');
      out.write('	');
 }else{
		
			String redirectURL = "index.jsp";
		    response.sendRedirect(redirectURL);
		
	   } 
      out.write('\n');
      out.write("\t\n");
      out.write("\t</body>\n");
      out.write("\t<script type=\"text/javascript\" src=\"../MDB/js/mdb.min.js\"></script>\t\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
