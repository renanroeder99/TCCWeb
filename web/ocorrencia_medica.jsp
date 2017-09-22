<%--
  Created by IntelliJ IDEA.
  User: Felipe de Jesus Cazagranda
  Date: 14/09/2017
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<$@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.TipoOcorrenciaMedicaDAO" %>
<%@ page import="dao.EmissorDAO" %>
<%@ page import="dao.OcorrenciaMedicaDAO" %>
<%@ page import="model.Emissor" %>

<%
    BaseOcorrencia baseOcorrencia = new BaseOcorrencia();

    Emissor emissor = (Emissor) session.getAttribute("emissor");

    baseOcorrencia.setRua(request.getParameter("ocorrência-medica-rua"));
    baseOcorrencia.setCep(Integer.parseInt(request.getParameter("ocorrencia-medica-cep")));
    baseOcorrencia.setNumeroResidencia(Integer.parseInt(request.getParameter("ocorrencia-medica-numero-residencia")));
    baseOcorrencia.setBaseTipoOcorrencia(TipoOcorrenciaMedicaDAO.buscarOcorrenciaMedicaPorID(Integer.parseInt(request.getParameter("ocorrencia_medica_id_tipo_ocorrencia"))));
    baseOcorrencia.setEmissor(emissor);
    int codigo = OcorrenciaMedicaDAO.inserir(baseOcorrencia);
    if(codigo > 0){
        response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
    }else{

    }

%>