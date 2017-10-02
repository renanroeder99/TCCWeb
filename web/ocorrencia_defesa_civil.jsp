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

    Emissor emissor = (Emissor) session.getAttribute("emissor");



    ocorrencia.setRua(request.getParameter("ocorrencia-defesa-rua"));
    ocorrencia.setCep(request.getParameter("ocorrencia-defesa-cep"));
    ocorrencia.setNumeroResidencia(Integer.parseInt(request.getParameter("ocorrencia-defesa-numero-residencia")));
    ocorrencia.setBaseTipoOcorrencia(TipoOcorrenciaDefesaCivilDAO.buscarDefesaCivilPorId(Integer.parseInt(request.getParameter("ocorrencia-defesa-tipo-ocorrencia"))));


    ocorrencia.setDescricao(request.getParameter("ocorrencia-defesa-descricao"));
    ocorrencia.setEmissor(emissor);
    int codigo = OcorrenciaDefesaCivilDAO.inserir(ocorrencia);
    if(codigo > 0){
        response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
    }else{

    }
%>

</body>
</html>
