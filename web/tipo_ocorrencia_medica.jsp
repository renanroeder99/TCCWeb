<%--
  Created by IntelliJ IDEA.
  User: Felipe de Jesus Cazagranda
  Date: 14/09/2017
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.BaseTipoOcorrencia" %>
<%@ page import="dao.TipoOcorrenciaMedicaDAO" %>

<%
    TipoOcorrenciaMedicaDAO tipoOcorrenciaMedicaDAO = new TipoOcorrenciaMedicaDAO();
    tipoOcorrenciaMedicaDAO.setTipo(request.getParameter("ocorrencia_medica_tipo"));
    tipoOcorrenciaMedicaDAO.setDescricao(request.getParameter("ocorrencia_medica_descricao"));
%>