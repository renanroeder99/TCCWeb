<%@ page import="model.Emissor" %>
<%@ page import="database.Conexao" %><%--
  Created by IntelliJ IDEA.
  User: Antony Henrique Vogel
  Date: 14/09/2017
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%--
    if(session.getAttribute("emissor") == null){
        response.sendRedirect("tela_usuario_login.jsp");
    }
    Emissor emissor = (Emissor) session.getAttribute("emissor");
    Conexao conexao = new Conexao();
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ocorrências</title>
</head>
<body >

<%Emissor emissor = new Emissor();%>
<h1 align="center">Bem Vindo <%=emissor.getNome()%></h1>
<style>
    body{
        background-color: #e3e8e8;
    }
    .botao {
        vertical-align: -15%;
        font-size: 30px;
        width: 200px;
        height: 50px;
        background-color: #8d9b9c;
        color: #070a09;
        opacity: 0.9;
        border: 3px double #070a09;
    }
</style>
<a href="tela_emitir_ocorrencia_medica.jsp" class="botao">Chamado Médico</a>
<a href="tela_emitir_ocorrencia_policial.jsp" class="botao">Chamado Policial</a>
<a href="tela_emitir_ocorrencia_corpo_de_bombeiros.jsp" class="botao">Chamado Bombeiros</a>
<a href="tela_emitir_ocorrencia_defesa_civil.jsp" class="botao">Chamado Defesa Civil</a>
</body>
</html>
