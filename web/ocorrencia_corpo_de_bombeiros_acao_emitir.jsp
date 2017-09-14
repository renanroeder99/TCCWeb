<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.TipoOcorrenciaCorpoDeBombeirosDAO" %>
<%@ page import="dao.EmissorDAO" %>
<%@ page import="dao.OcorrenciaCorpoDeBombeirosDAO" %><%--
  Created by IntelliJ IDEA.
  User: Daiane Machado
  Date: 14/09/2017
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    BaseOcorrencia baseOcorrencia = new BaseOcorrencia();
    baseOcorrencia.setLogradouro(request.getParameter("ocorrencia_corpo_de_bombeiros_logradouro"));
    baseOcorrencia.setRua(request.getParameter("ocorrencia_corpo_de_bombeiros_rua"));
    baseOcorrencia.setCep(Integer.parseInt(request.getParameter("ocorrencia_corpo_de_bombeiros_cep")));
    baseOcorrencia.setNumeroResidencia(Integer.parseInt(request.getParameter("ocorrencia_corpo_de_bombeiros_numero_residencia")));
    baseOcorrencia.setBaseTipoOcorrencia(TipoOcorrenciaCorpoDeBombeirosDAO.buscarCBPorID(Integer.parseInt(request.getParameter("ocorrencia_corpo_de_bombeiros"))));
    baseOcorrencia.setEmissor(EmissorDAO.buscarEmissorPorID(Integer.parseInt(request.getParameter("ocorrencia_corpo_de_bombeiros_emissor"))));
    OcorrenciaCorpoDeBombeirosDAO.inserir(baseOcorrencia);
%>

