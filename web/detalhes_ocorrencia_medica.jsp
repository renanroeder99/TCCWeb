<%@ page import="dao.OcorrenciaDefesaCivilDAO" %>
<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.OcorrenciaMedicaDAO" %>
<%@ page import="model.Receptor" %><%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 19/09/2017
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detalhes da ocorrencia</title>
    <%
        if(session.getAttribute("receptor") == null){
            response.sendRedirect("tela_usuario_login.jsp");
            return;
        }
        Receptor receptor = (Receptor) session.getAttribute("receptor");
    %>
</head>
<body>
<%BaseOcorrencia ocorrencia = OcorrenciaMedicaDAO.buscarOcorrenciaMedicaPorID(Integer.parseInt(request.getParameter("id")));%>
<h4>Nome: <%=ocorrencia.getEmissor().getNome()%></h4>
<h4>Ocorrencia: <%=ocorrencia.getBaseTipoOcorrencia().getTipo()%></h4>
<h4>Descrição: <%=ocorrencia.getBaseTipoOcorrencia().getDescricao()%></h4>
<h4>Telefone: <%=ocorrencia.getEmissor().getTelefone()%></h4>
<h4>RG: <%=ocorrencia.getEmissor().getRg()%></h4>
<h4>CPF: <%=ocorrencia.getEmissor().getCpf()%></h4>
<h4>Endereço da ocorrencia: <%=ocorrencia.endereco()%></h4>
<h4>Endereço do emissor: <%=ocorrencia.getEmissor().getEndereco()%></h4>
<h4>Email: <%=ocorrencia.getEmissor().getEmail()%></h4>
<h4>Quantidade de trotes: <%=ocorrencia.getEmissor().getTrote()%></h4>
<form action="ocorrencia_medica_validar.jsp?id=<%=ocorrencia.getId()%>" method="post">
    <input type="radio" id="foi_trote" name="feedback">
    <label for="foi_trote">Trote</label>
    <input type="radio" id= "nao_foi_trote" name="feedback">
    <label for="nao_foi_trote">Ocorrência válida</label>
<div>

</div>
<button type="submit"> Confirmar</button>
</form>
<a href="excluir_ocorrencia_medica.jsp?id=<%=ocorrencia.getId()%>">Excluir a ocorrência</a>
</body>
</html>
