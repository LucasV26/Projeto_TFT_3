/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.37
 * Generated at: 2021-01-26 05:33:24 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Controlers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import models.usuario;
import models.usuario;
import models.sinergia;
import models.sinergia;
import models.sinergia;

public final class sinergias_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(6);
    _jspx_dependants.put("/Controlers/../Views/head.html", Long.valueOf(1610745455443L));
    _jspx_dependants.put("/Controlers/../Views/synergyEdit.jsp", Long.valueOf(1611278245273L));
    _jspx_dependants.put("/Controlers/../Views/navBar.jsp", Long.valueOf(1611106491161L));
    _jspx_dependants.put("/Controlers/../Views/synergyDetail.jsp", Long.valueOf(1611019417699L));
    _jspx_dependants.put("/Controlers/../Views/foot.html", Long.valueOf(1611638818271L));
    _jspx_dependants.put("/Controlers/../Views/synergyList.jsp", Long.valueOf(1611279044501L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("models.sinergia");
    _jspx_imports_classes.add("models.usuario");
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

      out.write("\r\n");
      out.write("\r\n");
 
	int userID = 0;
	usuario userAdmin = new usuario();	

	if(session.getAttribute("userLogin") != null){	
		userID = (int) session.getAttribute("userLogin");
		userAdmin = new usuario(userID);
		userAdmin.searchUser();
	}

	String acao = request.getParameter("acao") == null ? "L" : request.getParameter("acao");

      out.write("\r\n");
      out.write("\r\n");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
 
	int IDuser = 0;
	usuario user = new usuario();

	if(session.getAttribute("userLogin") != null){	
		IDuser = (int) session.getAttribute("userLogin");
		user = new usuario(IDuser);
		user.searchUser();
	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("<nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\r\n");
      out.write("  <div class=\"container-fluid\">\r\n");
      out.write("    <img\r\n");
      out.write("        src=\"../Imagens/Misc/Logo.png\"\r\n");
      out.write("        width=\"120\"\r\n");
      out.write("        alt=\"Logo\"\r\n");
      out.write("      />\r\n");
      out.write("    <button\r\n");
      out.write("      class=\"navbar-toggler\"\r\n");
      out.write("      type=\"button\"\r\n");
      out.write("      data-mdb-toggle=\"collapse\"\r\n");
      out.write("      data-mdb-target=\"#navbarNav\"\r\n");
      out.write("      aria-controls=\"navbarNav\"\r\n");
      out.write("      aria-expanded=\"false\"\r\n");
      out.write("      aria-label=\"Toggle navigation\"\r\n");
      out.write("    >\r\n");
      out.write("      <i class=\"fas fa-bars\"></i>\r\n");
      out.write("    </button>\r\n");
      out.write("    <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\r\n");
      out.write("      <ul class=\"navbar-nav fs-5\">\r\n");
      out.write("        <li class=\"nav-item ms-5\">\r\n");
      out.write("          <a class=\"nav-link\" aria-current=\"page\" href=\"../Controlers/index.jsp\">Menu</a>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"nav-item ms-5\">\r\n");
      out.write("          <a class=\"nav-link\" href=\"../Controlers/builder.jsp\">Builder</a>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"nav-item ms-5\">\r\n");
      out.write("          <a class=\"nav-link\" href=\"../Controlers/campeoes.jsp?acao=L\">Campeões</a>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"nav-item ms-5\">\r\n");
      out.write("          <a class=\"nav-link\" href=\"../Controlers/sinergias.jsp?acao=L\">Sinergias</a>\r\n");
      out.write("        </li>\r\n");
      out.write("        \r\n");
      out.write("        <!-- Avatar -->\r\n");
      out.write("        <li class=\"nav-item dropdown text-center\" id=\"icone_user\">\r\n");
      out.write("          <a\r\n");
      out.write("            class=\"nav-link dropdown-toggle d-flex align-items-center\"\r\n");
      out.write("            href=\"#\"\r\n");
      out.write("            id=\"dropDownUser\"\r\n");
      out.write("            role=\"button\"\r\n");
      out.write("            data-mdb-toggle=\"dropdown\"\r\n");
      out.write("            aria-expanded=\"false\"\r\n");
      out.write("          >\r\n");
      out.write("            <img\r\n");
      out.write("              src=\"../Imagens/Usuarios/");
      out.print(user.getFOTO() );
      out.write("\"\r\n");
      out.write("              class=\"rounded-circle\"\r\n");
      out.write("              width=\"40\"\r\n");
      out.write("              alt=\"ImagemPerfil\"\r\n");
      out.write("            />\r\n");
      out.write("          </a>\r\n");
      out.write("          \r\n");
      out.write("\t        <ul class=\"dropdown-menu me-5\" aria-labelledby=\"dropDownUser\">\r\n");
      out.write("\t          <li><a class=\"dropdown-item\" href=\"../Controlers/user.jsp\">Meus Dados</a></li>\r\n");
      out.write("\t          <li><a class=\"dropdown-item\" href=\"../Controlers/builder.jsp?acao=L\">Minhas Builds</a></li>\r\n");
      out.write("\t          ");
 if(user.getID_NIVEL() > 1) 
	          		out.write("<li><a class=\"dropdown-item\" href=\"../Controlers/user.jsp?acao=C\">Controle de Usuários</a></li>");
	          
      out.write("\r\n");
      out.write("\t          <li><a class=\"dropdown-item\" href=\"#\" id=\"disconnectUser\">Logout</a></li>\r\n");
      out.write("\t        </ul>\r\n");
      out.write("        \r\n");
      out.write("      \t</li>\r\n");
      out.write("      </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</nav>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\t$(document).ready( function() {\r\n");
      out.write("\t\t$(\"#disconnectUser\").click( function() {\r\n");
      out.write("\t\t\t$.get(\"../Models/disconnectUser.jsp\", function(data) {\r\n");
      out.write("\t\t\t\twindow.location.replace(\"../Controlers/index.jsp\");\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("</script>");
      out.write("\r\n");
      out.write("\r\n");
 
	if(userID == 0){
		String redirectURL = "index.jsp";
	    response.sendRedirect(redirectURL);
	}else{

      out.write("\r\n");
      out.write("\r\n");
      out.write("\t");
if(acao.equals("L")){ 
      out.write("\r\n");
      out.write("\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	int IDusuario = 0;
	usuario nivelUser = new usuario();
	
	if(session.getAttribute("userLogin") != null){	
		IDusuario = (int) session.getAttribute("userLogin");
		nivelUser = new usuario(IDusuario);
		nivelUser.searchUser();
	}
	
	String tipo = request.getParameter("tipo") == null ? "C" : request.getParameter("tipo");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"container text-center\">   \r\n");
      out.write("\t<div class=\"btn-group btn-group-lg mt-5 mx-auto\" role=\"group\" aria-label=\"Basic example\">\r\n");
      out.write("\t  <a type=\"button\" class=\"btn btn-primary me-5 ");
      out.print(tipo.equals("C")?"active":"" );
      out.write("\" href=\"../Controlers/sinergias.jsp?acao=L&tipo=C\"> Classes </a>\r\n");
      out.write("\t  ");
 
	  	if(nivelUser.getID_NIVEL() >= 3){
	  		out.write("<button type=\"button\" class=\"btn btn-outline-primary text-light\" title=\"Criar nova Sinergia\" id=\"createSynergy\" data-mdb-ripple-color=\"dark\">" +
		  			  	"<i class=\"fas fa-plus\"></i>" +
		  			   "</button>");
	  	}
	  
      out.write("\r\n");
      out.write("\t  <a type=\"button\" class=\"btn btn-primary ms-5 ");
      out.print(tipo.equals("O")?"active":"" );
      out.write("\" href=\"../Controlers/sinergias.jsp?acao=L&tipo=O\"> Origens </a>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"row row-cols-1 row-cols-md-3 g-4 w-100\" id=\"synergyList\">\r\n");
      out.write("\t<!-- A lista de sinergias carrega aqui -->\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\t$(document).ready( function() {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(\"#synergyList\").on(\"click\", \"button#excluirSyn\", function(e) {\r\n");
      out.write("\t\t\t$.post(\"../Models/deleteSyn.jsp\", {idSyn: this.value}, function(data, status) {\r\n");
      out.write("\t\t\t\tif(data.success){\r\n");
      out.write("\t\t\t\t\twindow.alert(\"Sinergia apagada com sucesso!\");\r\n");
      out.write("\t\t\t\t\twindow.location.replace(\"../Controlers/sinergias.jsp?acao=L\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}, \"json\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(\"#createSynergy\").click(function() {\r\n");
      out.write("\t\t\t$.post(\"../Models/createSyn.jsp\", function(data, status) {\r\n");
      out.write("\t\t\t\twindow.alert(\"Nova sinergia criada com sucesso! Redirecionando para edição dos dados...\");\r\n");
      out.write("\t\t\t\twindow.location.replace(\"../Controlers/sinergias.jsp?acao=E&id=\"+data.id+\"\");\r\n");
      out.write("\t\t\t}, \"json\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$.getJSON(\"../Models/createSynList.jsp\", {\"tipo\":  ");
      out.print("\"" +tipo+ "\"" );
      out.write(" }, function(data, status){\r\n");
      out.write("\t\t\tvar saida = \"\";\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tvar ids = data.id;\r\n");
      out.write("\t\t\tvar nomes = data.nome;\r\n");
      out.write("\t\t\tvar fotos = data.foto;\r\n");
      out.write("\t\t\tvar descrips = data.descrip;\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tfor(var i = 0; i < ids.length; i++){\r\n");
      out.write("\t\t\t\tsaida += \"<div class=\\\"col p-0 m-0\\\">\";\r\n");
      out.write("\t\t\t\tsaida += \"<div class=\\\"card mt-5 ms-5 text-light\\\" id=\\\"sinCard\\\" style=\\\"max-width: 540px\\\">\";\r\n");
      out.write("\t\t\t\tsaida += \"  <div class=\\\"row g-0\\\">\";\r\n");
      out.write("\t\t\t\tsaida += \"    <div class=\\\"col-md-3 border border-light\\\" id=\\\"sinImage\\\">\";\r\n");
      out.write("\t\t\t\tsaida += \"\t\t<img\\r\\n\" + \r\n");
      out.write("\t\t\t\t\t\t\"        src=\\\"http://localhost:8080/TFTbuilder/Imagens/Sinergias/\"+fotos[i]+\"\\\"\\r\\n\" + \r\n");
      out.write("\t\t\t\t\t\t\"        alt=\\\" \"+ nomes[i] +\" \\\"\\r\\n\" + \r\n");
      out.write("\t\t\t\t\t\t\"        class=\\\"img-fluid mt-4 ms-2\\\"\\r\\n\" + \r\n");
      out.write("\t\t\t\t\t\t\"        width=\\\"100px\\\" \" +\r\n");
      out.write("\t\t\t\t\t\t\"      />\";\r\n");
      out.write("\t\t\t\tsaida += \"    </div>\";\r\n");
      out.write("\t\t\t\tsaida += \"\t  <div class=\\\"col-md-9\\\">\";\r\n");
      out.write("\t\t\t\tsaida += \"      <div class=\\\"card-body border border-light bg-primary\\\">\";\r\n");
      out.write("                saida += \"        <h4 class=\\\"card-title bg-dark text-danger text-center\\\">\"+ nomes[i] +\"</h4>\";\r\n");
      out.write("\t\t\t\tsaida += \"        <p class=\\\"card-text\\\">\";\r\n");
      out.write("\t\t\t\tsaida +=            descrips[i];\r\n");
      out.write("\t\t\t\tsaida += \"        </p>\";\r\n");
      out.write("\t\t\t\tsaida += \"        <h5 class=\\\"card-text row\\\">\";\r\n");
      out.write("\t\t\t\t");
 if(nivelUser.getID_NIVEL() >= 3){ 
      out.write("\r\n");
      out.write("\t\t\t\t\tsaida += \"          <a class=\\\"btn btn-primary col-2\\\" title=\\\"Editar Sinergia\\\" style=\\\"background-color: #FFA900\\\" href=\\\"../Controlers/sinergias.jsp?acao=E&id=\"+ids[i]+\"\\\" role=\\\"button\\\"> \";\r\n");
      out.write("\t\t\t\t\tsaida += \"          \t<i class=\\\"far fa-edit\\\"></i>\";\r\n");
      out.write("\t\t\t\t\tsaida += \"          </a>\";\r\n");
      out.write("\t\t\t\t\tsaida += \"          <div class=\\\"col-1\\\"> </div>\";\r\n");
      out.write("\t\t\t\t\tsaida += \"          <button class=\\\"btn btn-primary col-2\\\" title=\\\"Excluir Sinergia\\\" style=\\\"background-color: #F93154\\\" id=\\\"excluirSyn\\\" value=\\\"\"+ids[i]+\"\\\" role=\\\"button\\\"> \";\r\n");
      out.write("\t\t\t\t\tsaida += \"          \t<i class=\\\"fas fa-times\\\"></i>\";\r\n");
      out.write("\t\t\t\t\tsaida += \"          </button>\";\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\tsaida += \"          <div class=\\\"col-1\\\"> </div>\";\r\n");
      out.write("\t\t\t\tsaida += \"          <a class=\\\"btn btn-primary col-2\\\" title=\\\"Detalhar Sinergia\\\" style=\\\"background-color: #3b5998\\\" href=\\\"../Controlers/sinergias.jsp?acao=D&id=\"+ids[i]+\"\\\" role=\\\"button\\\"> \";\r\n");
      out.write("\t\t\t\tsaida += \"          \t<i class=\\\"fas fa-info-circle\\\"></i>\";\r\n");
      out.write("\t\t\t\tsaida += \"          </a>\\r\\n\" + \r\n");
      out.write("\t\t\t\t\t\t\"        </h5>\\r\\n\" + \r\n");
      out.write("\t\t\t\t\t\t\"      </div>\\r\\n\" + \r\n");
      out.write("\t\t\t\t\t\t\"    </div>\\r\\n\" + \r\n");
      out.write("\t\t\t\t\t\t\"  </div>\\r\\n\" + \r\n");
      out.write("\t\t\t\t\t\t\"</div>\";\r\n");
      out.write("\t\t\t\tsaida += \"</div>\";\t\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$(\"#synergyList\").html(saida);\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("</script>");
      out.write('\r');
      out.write('\n');
      out.write('	');
}else{ 
		if(acao.equals("D")){
      out.write("\r\n");
      out.write("\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    \r\n");

	int ID = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));

	sinergia sin = new sinergia(ID);
	sin.searchSynergy();

      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"container text-center mt-5\" id=\"sinDetail\">\r\n");
      out.write("\t<div class=\"row mt-5 border border-warning\">\r\n");
      out.write("\t\t<div class=\"col-3 border-end border-warning pt-5\">\r\n");
      out.write("\t\t\t<h2> ");
      out.print(sin.getNOME() );
      out.write(" </h2>\r\n");
      out.write("\t\t\t<img\r\n");
      out.write("\t\t\t  src=\"../Imagens/Sinergias/");
      out.print(sin.getFOTO() );
      out.write("\"\r\n");
      out.write("\t\t\t  class=\"img-fluid rounded-circle\"\r\n");
      out.write("\t\t\t  alt=\"");
      out.print(sin.getNOME() );
      out.write("\"\r\n");
      out.write("\t\t\t  width=\"200px\"\r\n");
      out.write("\t\t\t/>\r\n");
      out.write("\t\t\t<br>\r\n");
      out.write("\t\t\t<br>\r\n");
      out.write("\t\t\t<h4> Quantidade de marcas: <i class=\"fas fa-layer-group text-warning\"></i> ");
      out.print(sin.getMARCA() );
      out.write(" </h4>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"col-9 mt-5\">\r\n");
      out.write("\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t<h3 class=\"text-start\"> Descrição: </h3> \r\n");
      out.write("\t\t\t\t<div class=\"col-8 text-start\">\r\n");
      out.write("\t\t\t\t\t<p class=\"ms-5\"> ");
      out.print(sin.getDESCRIP() );
      out.write(" </p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<br>\r\n");
      out.write("\t\t\t<div class=\"row mt-5\">\r\n");
      out.write("\t\t\t\t<h4 class=\"text-start\"> Melhorias por Marca: </h4>\r\n");
      out.write("\t\t\t\t");

					String[] marcaDescrip_parts = sin.getMARCA_DESCRIP().split(";");
					int contador = 0;
					for(String markDescrip : marcaDescrip_parts){
						String[] partes = markDescrip.split("-");
						String[] nomes = {"Marca Bronze", "Marca Prata", "Marca Ouro", "Marca Platina"};
						
						out.write("<div class=\"col\" id=\"marca"+contador+"\" title=\""+nomes[contador]+"\"> " +
										"<h5> Campeões necessários para atingir a "+nomes[contador]+": "+ partes[0] +" </h5>" +
										"<br>" +
										"<p> Melhoria: "+ partes[1] +" </p>" + 
								  "</div>");
						contador++;
					}
				
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"row border border-warning\">\r\n");
      out.write("\t\t<div class=\"col border-end border-warning pt-3\">\r\n");
      out.write("\t\t\t<h4> Campeões ");
      out.print(sin.getNOME() );
      out.write(" </h4>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"row border border-warning\">\r\n");
      out.write("\t\t<div class=\"row row-cols-1 row-cols-md-3 g-3 w-50 pb-5 mx-auto\" id=\"campsRelated\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<!-- Os campeões que pertencem à sinergia aparecem aqui -->\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\t$(document).ready( function() {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$.getJSON(\"../Models/getSynData.jsp\", {\"sinID\":  ");
      out.print(ID );
      out.write(" }, function(data, status){\r\n");
      out.write("\t\t\tvar saida = \"\";\r\n");
      out.write("\t\t\tvar ids = data.id;\r\n");
      out.write("\t\t\tvar nomes = data.nome;\r\n");
      out.write("\t\t\tvar fotos = data.foto;\r\n");
      out.write("\t\t\tvar custos = data.custo;\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tfor(var i = 0; i < ids.length; i++){\r\n");
      out.write("\t\t\t\tsaida += \"<div class=\\\"col\\\">\";\r\n");
      out.write("\t\t\t\tsaida += \"\t<a href=\\\"../Controlers/campeoes.jsp?acao=D&id=\"+ids[i]+\"\\\" >\t<img src=\\\"http://localhost:8080/TFTbuilder/Imagens/Campeoes/\"+fotos[i]+\"\\\" class=\\\"img-fluid rounded-circle\\\" id=\\\"campeaoCusto\"+custos[i]+\"\\\" alt=\\\"\"+nomes[i]+\"\\\" width=\\\"50px\\\" /> </a>\";\r\n");
      out.write("\t\t\t\tsaida += \"</div>\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$(\"#campsRelated\").html(saida);\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("</script>");
      out.write('\r');
      out.write('\n');
      out.write('	');
	}else{
			if(acao.equals("E") && userAdmin.getID_NIVEL() > 2){
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    \r\n");

	int ID = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
	
	sinergia sin = new sinergia(ID);
	sin.searchSynergy();

      out.write("\r\n");
      out.write("\r\n");
      out.write("<form class=\"container text-center mt-5\" id=\"synEdit\">\r\n");
      out.write("\t<input type=\"hidden\" name=\"id\" value=\"");
      out.print(ID );
      out.write("\">\r\n");
      out.write("\t<div class=\"row mt-5 p-3\">\r\n");
      out.write("\t\t<div class=\"col-4 form-outline\"> \r\n");
      out.write("\t\t\t<input type=\"text\" name=\"nome\" id=\"nome\" class=\"form-control text-light\" required value=\"");
      out.print(sin.getNOME() );
      out.write("\" />\r\n");
      out.write("\t\t\t<label class=\"form-label text-warning\" for=\"nome\">Nome</label>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"col-1\"> </div>\r\n");
      out.write("\t\t<div class=\"col-4 form-outline\"> \r\n");
      out.write("\t\t\t<input type=\"text\" name=\"foto\" id=\"foto\" class=\"form-control text-light\" required value=\"");
      out.print(sin.getFOTO() );
      out.write("\" />\r\n");
      out.write("\t\t\t<label class=\"form-label text-warning\" for=\"foto\">Foto</label>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"col-1\"> </div>\r\n");
      out.write("\t\t<div class=\"col-2\"> \r\n");
      out.write("\t\t\t<label class=\"form-label text-warning\" for=\"tipo\">Tipo: </label>\r\n");
      out.write("\t\t\t<select name=\"tipo\" id=\"tipo\" required>\r\n");
      out.write("\t\t\t\t");

					String valorOutra = sin.getTIPO().equals("O")?"C":"O";
					String nomeSinAtual = sin.getTIPO().equals("O")?"Origem":"Classe";
					String nomeSinOutra = sin.getTIPO().equals("O")?"Classe":"Origem";
					
					String saida = "<option value=\""+sin.getTIPO()+"\"/ selected=\"selected\" /> "+ nomeSinAtual +"";
					saida += "<option value=\""+valorOutra+"\" /> "+nomeSinOutra+"";
					out.write(saida);
				
      out.write("\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"row mt-5 p-3\">\r\n");
      out.write("\t\t<div class=\"col-2\"> \r\n");
      out.write("\t\t\t<div class=\"form-outline\">\r\n");
      out.write("\t\t\t\t<input type=\"number\" name=\"marca\" id=\"marca\" class=\"form-control text-light\" min=\"1\" max=\"4\" required value=\"");
      out.print(sin.getMARCA() );
      out.write("\" />\r\n");
      out.write("\t\t\t\t<label class=\"form-label text-warning\" for=\"marca\">Quantidade de Marcas</label>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"col-3\"> \r\n");
      out.write("\t\t\t<div class=\"form-outline\">\r\n");
      out.write("\t\t\t\t<input type=\"number\" min=\"0\" name=\"qtdMK1\" id=\"qtdMK1\" class=\"form-control text-light\" required value=\"");
      out.print(sin.getQTD_MK1() );
      out.write("\" />\r\n");
      out.write("\t\t\t\t<label class=\"form-label text-warning\" for=\"qtdMK1\">Campeões para Marca 1 (Bronze)</label>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<br>\r\n");
      out.write("\t\t\t<div class=\"form-outline\">\r\n");
      out.write("\t\t\t\t<input type=\"number\" min=\"0\" name=\"qtdMK2\" id=\"qtdMK2\" class=\"form-control text-light\" required value=\"");
      out.print(sin.getQTD_MK2() );
      out.write("\" />\r\n");
      out.write("\t\t\t\t<label class=\"form-label text-warning\" for=\"qtdMK2\">Campeões para Marca 2 (Prata)</label>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<br>\r\n");
      out.write("\t\t\t<div class=\"form-outline\">\r\n");
      out.write("\t\t\t\t<input type=\"number\" min=\"0\" name=\"qtdMK3\" id=\"qtdMK3\" class=\"form-control text-light\" required value=\"");
      out.print(sin.getQTD_MK3() );
      out.write("\" />\r\n");
      out.write("\t\t\t\t<label class=\"form-label text-warning\" for=\"qtdMK3\">Campeões para Marca 3 (Ouro)</label>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<br>\r\n");
      out.write("\t\t\t<div class=\"form-outline\">\r\n");
      out.write("\t\t\t\t<input type=\"number\" min=\"0\" name=\"qtdMK4\" id=\"qtdMK4\" class=\"form-control text-light\" required value=\"");
      out.print(sin.getQTD_MK4() );
      out.write("\" />\r\n");
      out.write("\t\t\t\t<label class=\"form-label text-warning\" for=\"qtdMK4\">Campeões para Marca 4 (Platina)</label>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"col-1\"></div>\r\n");
      out.write("\t\t<div class=\"col-6\">\r\n");
      out.write("\t\t\t<p class=\"text-danger\"> * Separe a quantidade para atingir a melhoria com - (hífem) * </p> \r\n");
      out.write("\t\t\t<p class=\"text-danger\"> * Separe cada melhoria com ; (ponto e vírgula) * </p> \r\n");
      out.write("\t\t\t<div class=\"form-outline\">\r\n");
      out.write("\t\t\t\t<textarea name=\"markDescrip\" rows=\"3\" id=\"markDescrip\" class=\"form-control text-light\" required>");
      out.print(sin.getMARCA_DESCRIP() );
      out.write("</textarea> \r\n");
      out.write("\t\t\t\t<label class=\"form-label text-warning\" for=\"markDescrip\">Melhorias por marca</label>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"row mt-5 p-3\">\r\n");
      out.write("\t\t<div class=\"col-3\"></div>\r\n");
      out.write("\t\t<div class=\"col-6 form-outline\"> \r\n");
      out.write("\t\t\t<textarea name=\"descrip\" rows=\"3\" id=\"descrip\" class=\"form-control text-light\" required>");
      out.print(sin.getDESCRIP() );
      out.write("</textarea> \r\n");
      out.write("\t\t\t<label class=\"form-label text-warning\" for=\"descrip\">Descrição</label>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"col-3\"></div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"row mt-5 p-3\">\r\n");
      out.write("\t\t<button class=\"btn btn-primary col-1\" type=\"button\" title=\"Salvar Alterações\" style=\"background-color: #00B74A\" id=\"saveSyn\" value=\"");
      out.print(ID );
      out.write("\">\r\n");
      out.write("\t\t\t<i class=\"fas fa-check\"></i>\r\n");
      out.write("\t\t</button>\r\n");
      out.write("\t\t<div class=\"col-1\"></div>\r\n");
      out.write("\t\t<button class=\"btn btn-primary col-1\" type=\"button\" title=\"Excluir Sinergia\" style=\"background-color: #F93154\" id=\"excluirSyn\" value=\"");
      out.print(ID );
      out.write("\">\r\n");
      out.write("\t\t\t<i class=\"fas fa-times\"></i>\r\n");
      out.write("\t\t</button>\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\t$(document).ready( function() {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(\"#excluirSyn\").click(function() {\r\n");
      out.write("\t\t\t$.post(\"../Models/deleteSyn.jsp\", {idSyn: this.value}, function(data, status) {\r\n");
      out.write("\t\t\t\tif(data.success){\r\n");
      out.write("\t\t\t\t\twindow.alert(\"Sinergia apagada com sucesso!\");\r\n");
      out.write("\t\t\t\t\twindow.location.replace(\"../Controlers/sinergias.jsp?acao=L\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}, \"json\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(\"#saveSyn\").click(function() {\r\n");
      out.write("\t\t\tvar synData = $(\"#synEdit\").serialize();\r\n");
      out.write("\t\t\t$.post(\"../Models/changeSynData.jsp\", synData, function(data, status) {\r\n");
      out.write("\t\t\t\tconsole.log(synData);\r\n");
      out.write("\t\t\t\tif(data.success){\r\n");
      out.write("\t\t\t\t\twindow.alert(\"Dados da sinergia alterados com sucesso!\");\r\n");
      out.write("\t\t\t\t\twindow.location.replace(\"../Controlers/sinergias.jsp?acao=L\");\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\twindow.alert(\"Sua sinergia possui \" + $(\"#marca\").val() + \" marcas.\\nSertifique-se de adicionar uma quantidade de campeões para cada marca.\");\r\n");
      out.write("\t\t\t\t\tlocation.reload();\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}, \"json\");\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("</script>");
      out.write("\r\n");
      out.write("\t\t\t");
}else{
				String redirectURL = "index.jsp";
			    response.sendRedirect(redirectURL);
			}
		}
	  }
	}
      out.write("\r\n");
      out.write("\r\n");
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
