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
    <script src="lib/jquery-3.2.1.min.js" type=""></script>
    <script src="js/usuario-cadastrar.js"></script>
</head>
<body>
<%
    BaseOcorrencia ocorrenciaPolicial = new BaseOcorrencia();

    Emissor emissor = (Emissor) session.getAttribute("emissor");


    ocorrenciaPolicial.setRua(request.getParameter("ocorrencia-policial-rua"));
    ocorrenciaPolicial.setCep(request.getParameter("ocorrencia-policial-cep"));
    ocorrenciaPolicial.setNumeroResidencia(Integer.parseInt(request.getParameter("ocorrencia-policial-numero-residencia")));
    ocorrenciaPolicial.setBaseTipoOcorrencia(TipoOcorrenciaPolicialDAO.buscarOPPorID(Integer.parseInt(request.getParameter("ocorrencia-policial-tipo-ocorrencia"))));
    ocorrenciaPolicial.setDescricao(request.getParameter("ocorrencia-policial-descricao"));
    ocorrenciaPolicial.setEmissor(emissor);


    int codigo = OcorrenciaPolicialDAO.inserir(ocorrenciaPolicial);
    if(codigo > 0){

        response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
    }else{

    }
%>

</body>
</html>
