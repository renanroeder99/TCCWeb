<%--
  Created by IntelliJ IDEA.
  User: Felipe de Jesus Cazagra
  Date: 30/09/2017
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<$@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="model.BaseOcorrencia" %>
<%@ page import="dao.TipoOcorrenciaMedicaDAO" %>
<%@ page import="dao.EmissorDAO" %>

<%
    BaseOcorrencia baseOcorrencia = new BaseOcorrencia();
    baseOcorrencia.setLogradouro(request.getParameter("ocorrencia_medica_logradouro"));
    baseOcorrencia.setRua(request.getParameter("ocorrencia_medica_rua"));
    baseOcorrencia.setCep(Integer.parseInt(request.getParameter("ocorrencia_medica_cep")));
    baseOcorrencia.setNumeroResidencia(Integer.parseInt(request.getParameter("ocorrencia_medica_numero_residencia")));
    baseOcorrencia.setBaseTipoOcorrencia(TipoOcorrenciaMedicaDAO.buscarOcorrenciaMedicaPorID(Integer.parseInt(request.getParameter("ocorrencia_medica_id_tipo_ocorrencia"))));
    baseOcorrencia.setEmissor(EmissorDAO.buscarEmissorPorID(Integer.parseInt(request.getParameter("ocorrencia_medica_id_emissor"))));

%>