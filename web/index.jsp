<%@ page import="dao.EmissorDAO" %>
<%@ page import="model.Receptor" %>
<%@ page import="dao.ReceptorDAO" %>
<%@ page import="model.Emissor" %><%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 08/09/2017
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Sistema Valquíria</title>
      <%
          String email = request.getParameter("usuario-username");
          String senha = request.getParameter("usuario-senha");
          Emissor emissor = EmissorDAO.realizarLogin(email, senha);
          Receptor logadoReceptor = ReceptorDAO.realizarLogin(email, senha);%>

    <link rel="stylesheet" type="text/css" href="css/index.css">
  </head>
  <body>

  <%   if (emissor != null) {
    session.setAttribute("emissor", emissor);
    response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
  } else if (logadoReceptor != null) {
    session.setAttribute("email", email);

    switch (logadoReceptor.getCargo()) {
      case "MED":
        response.sendRedirect("tela_receptor_medico.jsp");
        break;
      case "DFC":
        response.sendRedirect("tela_receptor_defesa_civil.jsp");
        break;
      case "CDB":
        response.sendRedirect("tela_receptor_bombeiro.jsp");
        break;
      case "POL":
        response.sendRedirect("tela_receptor_policial.jsp");
        break;
    }

  } else {
    session.removeAttribute("email");
    response.sendRedirect("tela_usuario_login.jsp");
  }

  %>
  </body>
</html>
