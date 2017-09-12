
<$@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="model.BaseOcorrencia" %>
<%@ page import ="dao.OcorrenciaMedicaDAO" %>

<%
    BaseOcorrencia baseOcorrencia = new BaseOcorrencia();
    baseOcorrencia.setLogradouro(request.getParameter("ocorrencia_medica_logradouro"));
    baseOcorrencia.setRua(request.getParameter("ocorrencia_medica_rua"));
    baseOcorrencia.setCep(request.getParameter("ocorrencia_medica_cep"));
    baseOcorrencia.setNumeroResidencia(request.getParameter("ocorrencia_medica_numero_residencia"));
    baseOcorrencia.setBaseTipoOcorrencia(request.getParameter("ocorrencia_medica_id_tipo_ocorrencia"));
    baseOcorrencia.setEmissor(request.getParameter("ocorrencia_medica_id_emissor"));

%>