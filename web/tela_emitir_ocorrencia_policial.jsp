<%@ page import="dao.TipoOcorrenciaMedicaDAO" %>
<%@ page import="model.BaseTipoOcorrencia" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 98961
  Date: 14/09/2017
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="menu_superior.jsp"/>

<form action="ocorrencia_policial_acao_emitir.jsp" method="POST">
    <div>
        <label for="ocorrencia-policial-cep">Cep</label>
        <input type="text" id="ocorrencia-policial-cep" name="ocorrencia-policial-cep">
    </div>
    <div>
        <label for="ocorrencia-policial-rua">Rua</label>
        <input type="text" id="ocorrencia-policial-rua" name="ocorrencia-policial-rua">
    </div>
    
    <div>
        <label for="ocorrencia-policial-numero-residencia">Número Residência</label>
        <input type="text" id="ocorrencia-policial-numero-residencia" name="ocorrencia-policial-numero-residencia">
    </div>
    <div>
        <label>Tipo Ocorrencia</label>
        <select>
            <% ArrayList<BaseTipoOcorrencia> tipos = TipoOcorrenciaMedicaDAO.buscarOcorrenciaMedica();%>
            <% for (BaseTipoOcorrencia tipoOcorrencia : tipos) { %>
            <option value="<%= tipoOcorrencia.getId() %>"><%= tipoOcorrencia.getTipo() %>
            </option>
            <% } %>
        </select>
    </div>


    
</form>

</body>
</html>
