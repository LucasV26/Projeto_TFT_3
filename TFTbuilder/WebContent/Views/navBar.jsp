<%@page import="models.usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	int IDuser = 0;
	usuario user = new usuario();

	if(session.getAttribute("userLogin") != null){	
		IDuser = (int) session.getAttribute("userLogin");
		user = new usuario(IDuser);
		user.searchUser();
	}
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <img
        src="../Imagens/Misc/Logo.png"
        width="120"
        alt="Logo"
      />
    <button
      class="navbar-toggler"
      type="button"
      data-mdb-toggle="collapse"
      data-mdb-target="#navbarNav"
      aria-controls="navbarNav"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <i class="fas fa-bars"></i>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav fs-5">
        <li class="nav-item ms-5">
          <a class="nav-link" aria-current="page" href="../Controlers/index.jsp">Menu</a>
        </li>
        <li class="nav-item ms-5">
          <a class="nav-link" href="../Controlers/builder.jsp">Builder</a>
        </li>
        <li class="nav-item ms-5">
          <a class="nav-link" href="../Controlers/campeoes.jsp?acao=L">Campeões</a>
        </li>
        <li class="nav-item ms-5">
          <a class="nav-link" href="../Controlers/sinergias.jsp?acao=L">Sinergias</a>
        </li>
        
        <!-- Avatar -->
        <li class="nav-item dropdown text-center" id="icone_user">
          <a
            class="nav-link dropdown-toggle d-flex align-items-center"
            href="#"
            id="dropDownUser"
            role="button"
            data-mdb-toggle="dropdown"
            aria-expanded="false"
          >
            <img
              src="../Imagens/Usuarios/<%=user.getFOTO() %>"
              class="rounded-circle"
              width="40"
              alt="ImagemPerfil"
            />
          </a>
          
	        <ul class="dropdown-menu me-5" aria-labelledby="dropDownUser">
	          <li><a class="dropdown-item" href="../Controlers/user.jsp">Meus Dados</a></li>
	          <li><a class="dropdown-item" href="../Controlers/builder.jsp?acao=L">Minhas Builds</a></li>
	          <% if(user.getID_NIVEL() > 1) 
	          		out.write("<li><a class=\"dropdown-item\" href=\"../Controlers/user.jsp?acao=C\">Controle de Usuários</a></li>");
	          %>
	          <li><a class="dropdown-item" href="#" id="disconnectUser">Logout</a></li>
	        </ul>
        
      	</li>
      </ul>
    </div>
  </div>
</nav>


<script>
	$(document).ready( function() {
		$("#disconnectUser").click( function() {
			$.get("../Models/disconnectUser.jsp", function(data) {
				window.location.replace("../Controlers/index.jsp");
			});
		});
		
	});
</script>