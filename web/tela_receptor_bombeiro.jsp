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
<table>
    <thead>
    <tr>
            <th>Código</th>
            <th>Ocorrencia</th>
            <th>Endereço</th>
            <th>Emissor</th>
        </tr>
    </thead>

<tbody>

<% ArrayList<BaseOcorrencia> ocorrencias = OcorrenciaCorpoDeBombeirosDAO.retornarOcorrenciaBombeiro(); %>
<% for (BaseOcorrencia ocorrencia: ocorrencias) {%>
<tr>
    <td><%= ocorrencia.getId()%></td>
    <td><%= ocorrencia.getBaseTipoOcorrencia()%></td>
    <td><%= ocorrencia.endereco()%></td>
    <td><%= ocorrencia.getEmissor()%></td>
</tr>
<% } %>
</tbody>
</table>

</body>
</html>
