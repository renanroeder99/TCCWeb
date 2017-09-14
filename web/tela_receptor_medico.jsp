<%@ page import="model.Emissor" %>
<%@ page import="dao.EmissorDAO" %>
<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.OcorrenciaMedicaDAO" %><%--
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
<%
    BaseOcorrencia ocorrenciaMedica = OcorrenciaMedicaDAO.buscarOcorrenciaMedicaPorID(int id);
%>

        <table border="1">
            <% ArrayList<BaseOcorrencia> ocorrenciasBD = OcorrenciaMedicaDAO.buscarOcorrenciaMedicaPorID(int id); %>
        <thead>
            <tr>

                <%= ocorrencia.getId()%>
                <th>Ocorrencia</th>
                <%for (BaseOcorrencia ocorrenciaMedica : ocorrenciasBD){
                   ocorrenciaMedica.getId();
                }%>
                <th>CEP</th>
                <%for (BaseOcorrencia ocorrenciaMedica : ocorrenciasBD){
                    ocorrenciaMedica.getCEP();
                    }%>
                <th>Endereço</th>
                <%for (BaseOcorrencia ocorrenciaMedica : ocorrenciasBD){
                    ocorrenciaMedica.getEndereco();
                    }%>
                <th>Emissor</th>

                <%for (BaseOcorrencia ocorrenciaMedica : ocorrenciasBD){
                    ocorrenciaMedica.getEmissor();
                    }%>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Ocorrencia</th>
                <th>CEP</th>
                <th>Endereço</th>
                <th>Emissor</th>
            </tr>
        </tfoot>
    </table>


</body>
</html>
