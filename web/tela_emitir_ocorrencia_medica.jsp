<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.TipoOcorrenciaMedicaDAO" %>
<%@ page import="model.BaseTipoOcorrencia" %>
<%@ page import="model.Emissor" %><%--
  Created by IntelliJ IDEA.
  User: Felipe de Jesus Cazagranda
  Date: 14/09/2017
  Time: 15:58
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
    <title>Ocorrencia Médica</title>
    <link rel="stylesheet" type="text/css" href="css/tela_emitir_ocorrencia_medica.css">
</head>
<body>
<jsp:include page="menu_superior.jsp"/>
<h1 align="center" class="titulo">Ocorrência Médica</h1>
<form action="ocorrencia_medica.jsp" method="POST">

    <div>
        <label for="ocorrencia_medica_logradouro" class="logradouro_medico">Logradouro</label>
        <input type="text" id="ocorrencia_medica_logradouro" name="ocorrencia_medica_logradouro">
    </div>
    <br></br>
    <div>
        <label for="ocorrencia_medica_rua" class="rua_medica">Rua</label>
        <input type="text" id="ocorrencia_medica_rua" name="ocorrencia_medica_rua">
    </div>
    <br></br>
    <div>
        <label for="ocorrencia_medica_cep" class="cep_medico">CEP</label>
        <input type="text" id="ocorrencia_medica_cep" name="ocorrencia_medica_cep">
    </div>
    <br></br>
    <div>
        <label for="ocorrencia_medica_numero_residencia" class="numero_residencia_medica">Numero Residência</label>
        <input type="text" id="ocorrencia_medica_numero_residencia" name="ocorrencia_medica_numero_residencia">
    </div>
    <br></br>
    <div>
        <label class="tipo_medico">Tipo Ocorrencia</label>
        <select>
            <% ArrayList<BaseTipoOcorrencia> tipos = TipoOcorrenciaMedicaDAO.buscarOcorrenciaMedica();%>
            <% for (BaseTipoOcorrencia tipoOcorrencia : tipos) { %>
            <option value="<%= tipoOcorrencia.getId() %>"><%= tipoOcorrencia.getTipo() %>
            </option>
            <% } %>
        </select>
    </div>
    <br></br>
    <a href="tela_usuario_escolher_ocorrencia.jsp">Emitir</a>
</form>
</body>
</html>
