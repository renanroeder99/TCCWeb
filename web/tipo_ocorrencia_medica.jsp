<%--
  Created by IntelliJ IDEA.
  User: Felipe de Jesus Cazagranda
  Date: 14/09/2017
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.BaseTipoOcorrencia" %>

<%
    BaseTipoOcorrencia tipoOcorrenciaMedica = new BaseTipoOcorrencia();
    tipoOcorrenciaMedica.setTipo(request.getParameter("ocorrencia_medica_tipo"));
    tipoOcorrenciaMedica.setDescricao(request.getParameter("ocorrencia_medica_descricao"));
%>