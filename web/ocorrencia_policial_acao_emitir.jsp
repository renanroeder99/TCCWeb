<%@ page import="model.BaseOcorrencia" %>
<%@ page import="model.Emissor" %>
<%@ page import="dao.EmissorDAO" %>
<%@ page import="dao.TipoOcorrenciaDefesaCivilDAO" %>
<%@ page import="model.BaseTipoOcorrencia" %>
<%@ page import="dao.OcorrenciaPolicialDAO" %><%--
  Created by IntelliJ IDEA.
  User: Wanderso
  Date: 12/09/2017
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    BaseOcorrencia ocorrenciaPolicial = new BaseOcorrencia();
    ocorrenciaPolicial.setRua(request.getParameter("ocorrencia-rua"));
    ocorrenciaPolicial.setLogradouro(request.getParameter("ocorrencia-logradouro"));
    ocorrenciaPolicial.setCep(Integer.parseInt(request.getParameter("ocorrencia-cep")));
    ocorrenciaPolicial.setNumeroResidencia(Integer.parseInt(request.getParameter("ocorrencia-numero-residencia")));
    ocorrenciaPolicial.setBaseTipoOcorrencia(TipoOcorrenciaDefesaCivilDAO.buscarDefesaCivilPorId(Integer.parseInt(request.getParameter("ocorrencia-tipo-ocorrencia"))));
    ocorrenciaPolicial.setEmissor(EmissorDAO.buscarEmissorPorID(Integer.parseInt(request.getParameter("emissor"))));
    ocorrenciaPolicial.setId(Integer.parseInt(request.getParameter("ocorrenia-id")));
    OcorrenciaPolicialDAO.inserir(ocorrenciaPolicial);
%>

</body>
</html>
