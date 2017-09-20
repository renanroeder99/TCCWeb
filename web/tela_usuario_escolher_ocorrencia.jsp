<%@ page import="model.Emissor" %>
<%@ page import="database.Conexao" %><%--
  Created by IntelliJ IDEA.
  User: Antony Henrique Vogel
  Date: 14/09/2017
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<%
    if(session.getAttribute("emissor") == null){
        response.sendRedirect("tela_usuario_login.jsp");
    }
    Emissor emissor = (Emissor) session.getAttribute("emissor");

%>--%>
<%Emissor emissor = (Emissor) session.getAttribute("emissor");%>
<html>
<head>
    <title>Ocorrências</title>
    <link rel="stylesheet" type="text/css" href="css/tela_usuario_escolher_ocorrencia.css">
</head>
<body >

<h1 align="center">Bem Vindo, <%=emissor.getNome()%></h1>


<a href="tela_emitir_ocorrencia_medica.jsp" class="botao1">Chamado Médico</a>
<a href="tela_emitir_ocorrencia_policial.jsp" class="botao2">Chamado Policial</a>
<a href="tela_emitir_ocorrencia_corpo_de_bombeiros.jsp" class="botao3">Chamado Bombeiros</a>
<a href="tela_emitir_ocorrencia_defesa_civil.jsp" class="botao4">Chamado Defesa Civil</a>
</body>
</html>
