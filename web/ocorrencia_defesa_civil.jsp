<%@ page import="model.BaseOcorrencia" %>
<%@ page import="model.Emissor" %>
<%@ page import="dao.EmissorDAO" %>
<%@ page import="dao.TipoOcorrenciaDefesaCivilDAO" %>
<%@ page import="model.BaseTipoOcorrencia" %>
<%@ page import="dao.OcorrenciaDefesaCivilDAO" %><%--
  Created by IntelliJ IDEA.
  User: Antony Henrique Vogel
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
    BaseOcorrencia ocorrencia = new BaseOcorrencia();
    ocorrencia.setRua(request.getParameter("ocorrencia-rua"));
    ocorrencia.setLogradouro(request.getParameter("ocorrencia-logradouro"));
    ocorrencia.setCep(Integer.parseInt(request.getParameter("ocorrencia-cep")));
    ocorrencia.setNumeroResidencia(Integer.parseInt(request.getParameter("ocorrencia-numero-residencia")));
    ocorrencia.setBaseTipoOcorrencia(TipoOcorrenciaDefesaCivilDAO.buscarDefesaCivilPorId(Integer.parseInt(request.getParameter("ocorrencia-tipo-ocorrencia"))));
    ocorrencia.setEmissor(EmissorDAO.buscarEmissorPorID(Integer.parseInt(request.getParameter("emissor"))));
    ocorrencia.setId(Integer.parseInt(request.getParameter("ocorrenia-id")));
    int codigo = OcorrenciaDefesaCivilDAO.inserir(ocorrencia);
    if(codigo > 0){
        response.sendRedirect("tela_escolher_ocorrencia.jsp?id=" + codigo);
    }else{

    }
%>

</body>
</html>
