<%@ page import="model.Emissor" %><%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 14/09/2017
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%
    if(session.getAttribute("emissor") == null){
        response.sendRedirect("tela_usuario_login.jsp");
    }
    Emissor emissor = (Emissor) session.getAttribute("emissor");
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ocorrências</title>
</head>
<body>
<h4>Bem Vindo <%=emissor.getNome()%></h4>
<button type="submit" onclick=window.open("tela_emitir_ocorrencia_medica.jsp")>Ambulância Hospitalar</button>

<button type="submit" onclick=window.open("tela_emitir_ocorrencia_policial.jsp")>Polícia</button>
<button type="submit" onclick=window.open("tela_emitir_ocorrencia_corpo_de_bombeiros.jsp")>Corpo de Bombeiros</button>
<button type="submit" onclick=window.open("tela_emitir_ocorrencia_defesa_civil.jsp")>Defesa Civil</button>
</body>
</html>
