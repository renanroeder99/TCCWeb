<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.OcorrenciaCorpoDeBombeirosDAO" %>
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
    <link rel="stylesheet" type="text/css" href="css/tabelas.css">
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
<script type="text/javascript">
    setTimeout(function(){
        location = ''
    },15000)
</script>
<table class="form_caja">
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

    <% ArrayList<BaseOcorrencia> ocorrencias = OcorrenciaCorpoDeBombeirosDAO.retornarOcorrenciaBombeiro(); %>
    <% for (BaseOcorrencia ocorrencia: ocorrencias) {%>
    <tr>


        <td><%= ocorrencia.getId()%></td>
        <td><%= ocorrencia.getBaseTipoOcorrencia().getTipo()%></td>
        <td><%= ocorrencia.endereco()%></td>
        <td><%= ocorrencia.getEmissor()%></td>

        <td><a href="detalhes_ocorrencia_bombeiro.jsp?id=<%=ocorrencia.getId()%>">Detalhes</a></td>

    </tr>
    <% } %>
    </tbody>
</table>
    <a href="tela_receptor_cadastrar.jsp" class="botao">Cadastrar Receptor</a>
    <a href="tela_usuario_login.jsp" class="botao2">Sair</a>
</body>
</html>
