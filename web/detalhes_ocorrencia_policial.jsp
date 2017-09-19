<%@ page import="dao.OcorrenciaPolicialDAO" %>
<%@ page import="model.BaseOcorrencia" %><%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 19/09/2017
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detalhes da ocorrencia</title>
</head>
<body>
<%BaseOcorrencia ocorrencia = OcorrenciaPolicialDAO.buscarOcorrenciaPolicialPorID(ocorrencia);%>
<h4>Nome: <%ocorrencia.getEmissor().getNome();%></h4>
<h4>Ocorrencia: <%ocorrencia.getBaseTipoOcorrencia().getTipo();%></h4>
<h4>Descrição: <%ocorrencia.getBaseTipoOcorrencia().getDescricao();%></h4>
<h4>Telefone: <%ocorrencia.getEmissor().getTelefone();%></h4>
<h4>RG: <%ocorrencia.getEmissor().getRg();%></h4>
<h4>CPF: <%ocorrencia.getEmissor().getCpf();%></h4>
<h4>Endereço: <%ocorrencia.getEmissor().getEndereco();%></h4>
<h4>Email: <%ocorrencia.getEmissor().getEmail();%></h4>
<h4>Quantidade de trotes: <%ocorrencia.getEmissor().getTrote();%></h4>
</body>
</html>
