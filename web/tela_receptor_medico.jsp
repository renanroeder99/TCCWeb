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
            <th>Código</th>
            <th>Ocorrencia</th>
            <th>Endereço</th>
            <th>Emissor</th>
            <th>Detalhes</th>

        </tr>
    </thead>
<tbody>
<% ArrayList<BaseOcorrencia> ocorrencias = OcorrenciaMedicaDAO.retornarOcorrenciasMedica(); %>
<% for (BaseOcorrencia ocorrenciaMedica: ocorrencias) { %>
<tr>
    <td><%= ocorrenciaMedica.getId()%></td>
    <td><%= ocorrenciaMedica.getBaseTipoOcorrencia().getTipo()%></td>
    <td><%= ocorrenciaMedica.endereco()%></td>
    <td><%= ocorrenciaMedica.getEmissor()%></td>
    <td><a href="detalhes_ocorrencia_medica.jsp?id=<%=ocorrenciaMedica.getId()%>">Detalhes</a></td>
</tr>
<% } %>
</tbody>
</table>
</body>
</html>