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

<%
    if(session.getAttribute("receptor") == null){
        response.sendRedirect("tela_usuario_login.jsp");
        return;
    }
    Receptor receptorLogado = (Receptor) session.getAttribute("receptor");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/tabelas.css">
    <link rel="stylesheet" type="text/css" href="css/tela_receptor.css">
    <title>Ocorrências Policiais</title>
    <meta charset="UTF-8"/>
</head>
<body>
<script type="text/javascript">
    setTimeout(function(){
        location = ''
    },15000)
</script>
<div class="botoes">
    <a href="tela_receptor_cadastrar.jsp" class="botao">Cadastrar Receptor</a>
    <a href="deslogar.jsp" class="botao2">Sair</a>
</div>
<div>
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

        <% ArrayList<BaseOcorrencia> ocorrencias = OcorrenciaPolicialDAO.retornarOcorrenciaPolicial(); %>
        <% for (BaseOcorrencia ocorrencia: ocorrencias) {%>
        <tr>


            <td><%= ocorrencia.getId()%></td>
            <td><%= ocorrencia.getBaseTipoOcorrencia().getTipo()%></td>
            <td><%= ocorrencia.endereco()%></td>
            <td><%= ocorrencia.getEmissor()%></td>

            <td><a href="detalhes_ocorrencia_policial.jsp?id=<%=ocorrencia.getId()%>">Detalhes</a></td>

        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>

