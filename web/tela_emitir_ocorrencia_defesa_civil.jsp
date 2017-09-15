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
</head>
<body>
<jsp:include page="menu_superior.jsp"/>
<form action="ocorrencia_defesa_civil_acao_emitir.jsp" method="POST">
    <div>
        <label for="ocorrencia-cep">Cep</label>
        <input type="text" id="ocorrencia-cep" name="ocorrencia-rua">
    </div>

    <div>
        <label for="ocorrencia-rua">Rua</label>
        <input type="" id="ocorrencia-rua" name="ocorrencia_defesa_civil">
    </div>

    <div>
        <label for="ocorrencia-numero-residencia">Numero Residência</label>
        <input type="text" id="ocorrencia-numero-residencia" name="ocorrencia_defesa_civil_numero_residencia">
    </div>

    <div>
        <label>Tipo Ocorrencia</label>
        <select>
            <% ArrayList<BaseTipoOcorrencia> tipos = TipoOcorrenciaDefesaCivilDAO.buscarOcorrenciaDefesaCivil();%>
            <% for (BaseTipoOcorrencia tipoOcorrencia : tipos) { %>
            <option value="<%= tipoOcorrencia.getId() %>"><%= tipoOcorrencia.getTipo() %>
            </option>
            <% } %>
        </select>
    </div>

    <div>
        <label for="ocorrencia-descricao">Descrição</label>
    </div>
    <div>
        <textarea name="ocorrencia-descricao" id="ocorrencia-descricao" cols="30" rows="10"></textarea>
    </div>

    <button type="submit">Emitir</button>


</form>
</body>
</html>
