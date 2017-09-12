<%--
  Created by IntelliJ IDEA.
  User: 99051
  Date: 12/09/2017
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<jsp:include page="menu_superior.jsp"/>

<form action="ocorrencia_medica.jsp" method="POST">

    <div>
        <label for="ocorrencia_medica_logradouro">Logradouro</label>
        <input type="text" id="ocorrencia_medica_logradouro" name="ocorrencia_medica_logradouro">
    </div>

    <div>
        <label for="ocorrencia_medica_rua">Rua</label>
        <input type="text" id="ocorrencia_medica_rua" name="ocorrencia_medica_rua">
    </div>

    <div>
        <label for="ocorrencia_medica_cep">CEP</label>
        <input type="text" id="ocorrencia_medica_cep" name="ocorrencia_medica_cep">
    </div>

    <div>
        <label for="ocorrencia_medica_numero_residencia">Numero Residência</label>
        <input type="text" id="ocorrencia_medica_numero_residencia" name="ocorrencia_medica_numero_residencia">
    </div>

    <button type="submit">Cadastrar</button>
</form>
</body>
</html>
