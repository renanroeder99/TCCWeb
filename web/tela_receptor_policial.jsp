<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.OcorrenciaPolicialDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Emissor" %><%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 14/09/2017
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ocorrencias Policiais</title>
</head>
<body>
<table>
    <thead>
    <tr>


        <th>Código</th>
        <th>Ocorrencia</th>
        <th>Endereço</th>
        <th>Emissor</th>
        <th>Emissor</th>
    </tr>
    </thead>


    <tbody>
    <% ArrayList<BaseOcorrencia> ocorrencias = OcorrenciaPolicialDAO.retornarOcorrenciaPolicial(); %>
    <% for (BaseOcorrencia ocorrenciaPolicial : ocorrencias) {%>
    <tr>
        <td><%= ocorrenciaPolicial.getId()%>
        </td>
        <td><%= ocorrenciaPolicial.getBaseTipoOcorrencia()%>
        </td>
        <td><%= ocorrenciaPolicial.endereco()%>
        </td>
        <td><%= ocorrenciaPolicial.getEmissor()%>
        </td>
        <td><a href="detalhes_ocorrencia_policial.jsp?id=<%=ocorrenciaPolicial.getId()%>">Editar</a></td>

    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>
