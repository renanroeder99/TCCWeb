<%@ page import="model.BaseOcorrencia" %>
<%@ page import="model.Emissor" %>
<%@ page import="dao.EmissorDAO" %>
<%@ page import="dao.TipoOcorrenciaDefesaCivilDAO" %>
<%@ page import="model.BaseTipoOcorrencia" %>
<%@ page import="dao.OcorrenciaPolicialDAO" %>
<%@ page import="dao.TipoOcorrenciaPolicialDAO" %><%--
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

    Emissor emissor = (Emissor) session.getAttribute("emissor");


    ocorrenciaPolicial.setRua(request.getParameter("ocorrencia-policial-rua"));
    ocorrenciaPolicial.setLogradouro(request.getParameter("ocorrencia-policial-logradouro"));
    ocorrenciaPolicial.setCep(Integer.parseInt(request.getParameter("ocorrencia-policial-cep")));
    ocorrenciaPolicial.setNumeroResidencia(Integer.parseInt(request.getParameter("ocorrencia-policial-numero-residencia")));
    ocorrenciaPolicial.setBaseTipoOcorrencia(TipoOcorrenciaPolicialDAO.buscarOPPorID(Integer.parseInt(request.getParameter("ocorrencia-policial-tipo-ocorrencia"))));
    ocorrenciaPolicial.setEmissor(emissor);


    int codigo = OcorrenciaPolicialDAO.inserir(ocorrenciaPolicial);
    if(codigo > 0){
        response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
    }else{

    }
%>

</body>
</html>
