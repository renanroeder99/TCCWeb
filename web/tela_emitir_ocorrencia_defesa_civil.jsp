<%@ page import="dao.TipoOcorrenciaDefesaCivilDAO" %>
<%@ page import="model.BaseTipoOcorrencia" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Antony Henrique Vogel
  Date: 12/09/2017
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/tela_emitir_ocorrencia_defesa_civil_acao.css">
</head>
<body>

<jsp:include page="menu_superior.jsp"/>
<h1 align="center" class="labeltitulo">Ocorrencia Defesa Civil</h1>
<form action="ocorrencia_defesa_civil_acao_emitir.jsp" method="POST">
    <div>
        <label for="ocorrencia-cep" class="lab">Cep</label>
        <input type="text" id="ocorrencia-cep" name="ocorrencia-rua">
    </div>

    <div>
        <label for="ocorrencia-rua" class="labe">Rua</label>
        <input type="" id="ocorrencia-rua" name="ocorrencia_defesa_civil">
    </div>

    <div>
        <label for="ocorrencia-numero-residencia"class="lab1">Numero Residência</label>
        <input type="text" id="ocorrencia-numero-residencia" name="ocorrencia_defesa_civil_numero_residencia">
    </div>

    <div>
        <label class="label-ocorrencia">Tipo Ocorrencia</label>
        <select>
            <% ArrayList<BaseTipoOcorrencia> tipos = TipoOcorrenciaDefesaCivilDAO.buscarOcorrenciaDefesaCivil();%>
            <% for (BaseTipoOcorrencia tipoOcorrencia : tipos) { %>
            <option value="<%= tipoOcorrencia.getId() %>"><%= tipoOcorrencia.getTipo() %>
            </option>
            <% } %>
        </select>
    </div>

    <div>
        <label for="ocorrencia-descricao" class="labe1">Descrição</label>
    </div>
    <div>
        <textarea name="ocorrencia-descricao" id="ocorrencia-descricao" cols="30" rows="10"></textarea>
    </div>

    <button type="submit">Emitir</button>


</form>
</body>
</html>
