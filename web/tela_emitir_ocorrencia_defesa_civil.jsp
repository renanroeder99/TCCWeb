<%@ page import="dao.TipoOcorrenciaDefesaCivilDAO" %>
<%@ page import="model.BaseTipoOcorrencia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Emissor" %>
<%@ page import="model.BaseOcorrencia" %><%--
  Created by IntelliJ IDEA.
  User: Antony Henrique Vogel
  Date: 12/09/2017
  Time: 15:37
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
    <title>Ocorrência Defesa Civil</title>
    <link rel="stylesheet" type="text/css" href="css/tela_emitir_ocorrencia_defesa_civil.css">
</head>
<body>
<jsp:include page="menu_superior_defesa_civil.jsp"/>

<h1 align="center" class="labeltitulo">Ocorrencia Defesa Civil</h1>
<form action="ocorrencia_defesa_civil.jsp" method="POST">
    <div>
        <br>
        <label for="ocorrencia-rua" class="label-cadastro">Rua</label>
        <input type="text" id="ocorrencia-rua" name="ocorrencia-rua">
    </div>
    <div>
        <br>
        <label for="ocorrencia-cep" class="label-cadastro">CEP</label>
        <input type="text" id="ocorrencia-cep" name="ocorrencia_defesa_civil">
    </div>
    <div>
        <br>
        <label for="ocorrencia-numero-residencia"class="label-cadastro">Número da Residência</label>
        <input type="text" id="ocorrencia-numero-residencia" name="ocorrencia_defesa_civil_numero_residencia">
    </div>
    <div>
        <br>
        <label class="label-cadastro">Tipo da Ocorrência</label>
        <select name="ocorrencia-defesa-civil-tipo-ocorrencia">
            <% ArrayList<BaseTipoOcorrencia> tipos = TipoOcorrenciaDefesaCivilDAO.buscarOcorrenciaDefesaCivil();%>
            <% for (BaseTipoOcorrencia tipoOcorrencia : tipos) { %>
            <option value="<%= tipoOcorrencia.getId() %>"><%= tipoOcorrencia.getTipo() %>
            </option>
            <% } %>
        </select>

        <label for="ocorrencia-descricao" class="label-cadastro">Descrição</label>
    <div>
    </div>
        <textarea name="ocorrencia-descricao" id="ocorrencia-descricao" cols="30" rows="10"></textarea>
    <button type="submit">Emitir</button>
</form>
</body>
</html>
