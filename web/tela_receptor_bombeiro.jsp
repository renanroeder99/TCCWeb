<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.OcorrenciaCorpoDeBombeirosDAO" %>
<%@ page import="javax.swing.*" %>
<%@ page import="model.Receptor" %><%--
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
    <%
        if(session.getAttribute("receptor") == null){
            response.sendRedirect("tela_usuario_login.jsp");
            return;
        }
        Receptor receptor = (Receptor) session.getAttribute("receptor");
    %>
</head>
<body>
<form action="receptor_acao_cadastrar.jsp" method="POST"/>
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
            <th>Status</th>
            <th>Detalhes</th>
        </tr>
    </thead>

<tbody>

<% ArrayList<BaseOcorrencia> ocorrencias = OcorrenciaCorpoDeBombeirosDAO.retornarOcorrenciaBombeiro(); %>
<% for (BaseOcorrencia ocorrencia: ocorrencias) {%>
<tr>
    <%String statusTrote;%>
    <td><%= ocorrencia.getId()%></td>
    <td><%= ocorrencia.getBaseTipoOcorrencia().getTipo()%></td>
    <td><%= ocorrencia.endereco()%></td>
    <td><%= ocorrencia.getEmissor()%></td>
    <%if (ocorrencia.getStatus() == 1){%>
            <%statusTrote = "Trote";%>
            <td><%=statusTrote%></td>
    <%}else if (ocorrencia.getStatus() == 2){%>
            <%statusTrote = "Validado";%>
            <td><%=statusTrote%></td>
    <%}else if(ocorrencia.getStatus() == 0){%>
            <%statusTrote = "Em aberto" + ocorrencia.getStatus();%>
            <td><%=statusTrote%></td>
    <%}%>

    <td><a href="detalhes_ocorrencia_bombeiro.jsp?id=<%=ocorrencia.getId()%>">Detalhes</a></td>
</tr>
<% } %>
</tbody>
</table>

</body>
</html>
