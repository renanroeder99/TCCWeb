<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.OcorrenciaMedicaDAO" %>
<%@ page import="model.Receptor" %><%--
  Created by IntelliJ IDEA.
  User: Felipe de Jesus Cazagranda
  Date: 14/09/2017
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/tabelas.css">

    <title>Ocorrencias Médicas</title>
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

    <th>Detalhes</th>
</tr>
</thead>

    <tbody>

    <% ArrayList<BaseOcorrencia> ocorrencias = OcorrenciaMedicaDAO.retornarOcorrenciasMedica(); %>
    <% for (BaseOcorrencia ocorrencia: ocorrencias) {%>
    <tr>


        <td><%= ocorrencia.getId()%></td>
        <td><%= ocorrencia.getBaseTipoOcorrencia().getTipo()%></td>
        <td><%= ocorrencia.endereco()%></td>
        <td><%= ocorrencia.getEmissor()%></td>

        <td><a href="detalhes_ocorrencia_medica.jsp?id=<%=ocorrencia.getId()%>">Detalhes</a></td>

    </tr>
    <% } %>
    </tbody>
</table>
    <a href="tela_receptor_cadastrar.jsp" class="botao">Cadastrar Receptor</a>
    <a href="deslogar.jsp" class="botao2">Sair</a>
</form>
</body>
</html>