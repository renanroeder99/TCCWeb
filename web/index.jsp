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
<%     if(session.getAttribute("emissor") != null){
    response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
    return;
}
    if(session.getAttribute("receptor") != null){
        response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
        Receptor receptor = (Receptor) session.getAttribute("receptor");
        switch (receptor.getCargo()) {
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
        return;
    }
    response.sendRedirect("tela_usuario_login.jsp"); %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Sistema Valquíria</title>


    <link rel="stylesheet" type="text/css" href="css/index.css">
  </head>
  <body>

  </body>
</html>
