<%@ page import="model.Receptor" %>
<%@ page import="model.Emissor" %><%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 18/09/2017
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("emissor") != null){
        response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
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
                response.sendRedirect("tela_receptor_medico.jsp");
                break;
            case "POL":
                response.sendRedirect("tela_receptor_policial.jsp");
                break;
        }
    }
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <div>
        <label for="usuario-nome">Nome completo</label>
        <input type="text" id="usuario-nome" name="usuario-nome" required="required">
    </div>
    <div>
        <label for="usuario-username">Email</label>
        <input type="text" id="usuario-username" name="usuario-username"  required="required">
    </div>
    <label for="usuario-email">Confirmar email</label>
    <input type="email" id="usuario-email" name="usuario-email" required="required">
</div>

<div>
    <label for="usuario-rg">RG</label>
    <input type="number" id="usuario-rg" name="usuario-rg" required="required">
</div>
<div>
    <label for="usuario-cpf">CPF</label>
    <input type="text" id="usuario-cpf" name="usuario-cpf" required="required">
</div>

<a href="tela_usuario_alterar.jsp?id=">Esqueci minha senha</a>
</body>
</html>
