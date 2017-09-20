<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.OcorrenciaMedicaDAO" %>
<%@ page import="model.Emissor" %><%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 14/09/2017
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ocorrencias Médicas</title>
</head>
<body>
<script type="text/javascript">
    setTimeout(function(){
        location = ''
    },15000)
</script>
<table>
    <thead>
        <tr>
            <td>Código</td>
            <td>Ocorrencia</td>
            <td>Endereço</td>
            <td>Emissor</td>

        </tr>
    </thead>
<tbody>
<% ArrayList<BaseOcorrencia> ocorrencias = OcorrenciaMedicaDAO.retornarOcorrenciasMedica(); %>
<% for (BaseOcorrencia ocorrencia: ocorrencias) { %>
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