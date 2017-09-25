<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.OcorrenciaPolicialDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Emissor" %>
<%@ page import="model.Receptor" %><%--
  Created by IntelliJ IDEA.
  User: Wanderson Ferreira
  Date: 14/09/2017
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ocorrencias Policiais</title>
    <%
        if(session.getAttribute("receptor") == null){
            response.sendRedirect("tela_usuario_login.jsp");
            return;
        }
        Receptor receptorLogado = (Receptor) session.getAttribute("receptor");
    %>
</head>
<body>
<form action="receptor_acao_cadastrar.jsp" method="POST">
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

    <% ArrayList<BaseOcorrencia> ocorrencias = OcorrenciaPolicialDAO.retornarOcorrenciaPolicial(); %>
    <% for (BaseOcorrencia ocorrencia: ocorrencias) {%>
    <tr>
        <%String statusTrote;%>

        <td><%= ocorrencia.getId()%></td>
        <td><%= ocorrencia.getBaseTipoOcorrencia().getTipo()%></td>
        <td><%= ocorrencia.endereco()%></td>
        <td><%= ocorrencia.getEmissor()%></td>
        <%if (ocorrencia.getStatus() == 1){%>
            <%statusTrote = "Trote";%>
        <%}else if (ocorrencia.getStatus() == 2){%>
            <%statusTrote = "Validado";%>
        <%}else {%>
            <%statusTrote = "Em aberto";%>
        <%}%>
        <td><%=statusTrote%></td>
        <td><a href="detalhes_ocorrencia_policial.jsp?id=<%=ocorrencia.getId()%>">Detalhes</a></td>

    </tr>
    <% } %>
    </tbody>
</table>

        <a href="tela_receptor_cadastrar.jsp">Cadastrar Receptor</a>


</body>
</html>
