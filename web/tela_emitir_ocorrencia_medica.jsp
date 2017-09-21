<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.TipoOcorrenciaMedicaDAO" %>
<%@ page import="model.BaseTipoOcorrencia" %>
<%@ page import="model.Emissor" %>
<%@ page import="model.BaseOcorrencia" %><%--
  Created by IntelliJ IDEA.
  User: Felipe de Jesus Cazagranda
  Date: 14/09/2017
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>

<%
    if(session.getAttribute("emissor") == null){
        response.sendRedirect("tela_usuario_login.jsp");
        return;
    }
    Emissor emissor = (Emissor) session.getAttribute("emissor");
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ocorrencia Médica</title>
    <link rel="stylesheet" type="text/css" href="css/tela_emitir_ocorrencia_medica.css">
    <link rel="stylesheet" type="text/css" href="css/menu_superior.css">
    <link rel="stylesheet" href="assets/libs/font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<body>

<jsp:include page="menu_superior_medico.jsp"/>

<h1 align="center" class="titulo">Ocorrência Médica</h1>

<form class="formulario-cadastro" action="ocorrencia_medica.jsp" method="POST">

    <div class="campos">
        <div class="esquerda">
            <label for="ocorrencia_medica_rua" class="">Rua</label>
            <input type="text" id="ocorrencia_medica_rua" name="ocorrencia_medica_rua">
        </div>
        <div class="direita">
            <label for="ocorrencia_medica_cep" class="">CEP</label>
            <input type="text" id="ocorrencia_medica_cep" name="ocorrencia_medica_cep">
        </div>
    </div>

    <div class="campos">
        <div class="esquerda">
            <label for="ocorrencia_medica_numero_residencia" class="">Número da Residência</label>
            <input type="text" id="ocorrencia_medica_numero_residencia" name="ocorrencia_medica_numero_residencia">
        </div>
        <div class="direita">
            <label class="">Tipo da Ocorrência</label>
            <select name="ocorrencia_medica_id_tipo_ocorrencia">
                <% ArrayList<BaseTipoOcorrencia> tipos = TipoOcorrenciaMedicaDAO.buscarOcorrenciaMedica();%>
                <% for (BaseTipoOcorrencia tipoOcorrencia : tipos) { %>
                <option value="<%= tipoOcorrencia.getId() %>"><%= tipoOcorrencia.getTipo() %>
                </option>
                <% } %>
            </select>
        </div>

    </div>
    <div>
        <label for="descricao" class="">Descrição</label>
        <textarea name="descricao" id="descricao" cols="30" rows="10"></textarea>
    </div>

    <button type="submit">Emitir</button>
</form>
</body>
</html>
