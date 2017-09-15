<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.OcorrenciaCorpoDeBombeirosDAO" %><%--
  Created by IntelliJ IDEA.
  User: Daiane Machado
  Date: 14/09/2017
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ocorrencias Bombeiros</title>
</head>
<body>
<table border="1">
    <thead>
        <tr>
            <td>Código</td>
            <td>Ocorrencia</td>
            <td>Endereço</td>
            <td>Emissor</td>
        </tr>
    </thead>
</table>
</body>
<% ArrayList<BaseOcorrencia> baseOcorrencias = OcorrenciaCorpoDeBombeirosDAO.r
    /html>
