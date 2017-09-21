<%@ page import="model.Emissor" %>
<%@ page import="database.Conexao" %>
<%@ page import="model.Receptor" %><%--
  Created by IntelliJ IDEA.
  User: Antony Henrique Vogel
  Date: 14/09/2017
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    if (session.getAttribute("receptor") != null) {
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
        if (session.getAttribute("emissor") == null) {
            response.sendRedirect("tela_usuario_login.jsp");
            return;
    }
    Emissor emissor = (Emissor) session.getAttribute("emissor");
%>

<html>
<head>
    <title>Ocorrências</title>
    <link rel="stylesheet" type="text/css" href="css/tela_usuario_escolher_ocorrencia.css">
</head>
<body>
<h1 align="center">Bem Vindo, <%emissor.getUsuario();%>!</h1>
<div class="pai2">
    <a href="tela_emitir_ocorrencia_medica.jsp" class="botao1">Chamado Médico</a>
</div>
<div class="pai3">
    <a href="tela_emitir_ocorrencia_policial.jsp" class="botao2">Chamado Policial</a>
</div>
<div class="pai4">
    <a href="tela_emitir_ocorrencia_corpo_de_bombeiros.jsp" class="botao3">Chamado Bombeiros</a>
</div>
<div class="pai5">
    <a href="tela_emitir_ocorrencia_defesa_civil.jsp" class="botao4">Chamado Defesa Civil</a>
</div>
<textarea cols="30" rows="10" class="text_area"></textarea>

</body>
</html>
