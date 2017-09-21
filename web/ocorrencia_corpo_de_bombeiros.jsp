<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.TipoOcorrenciaCorpoDeBombeirosDAO" %>
<%@ page import="dao.EmissorDAO" %>
<%@ page import="dao.OcorrenciaCorpoDeBombeirosDAO" %>
<%@ page import="model.Emissor" %><%--
  Created by IntelliJ IDEA.
  User: Daiane Machado
  Date: 14/09/2017
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    BaseOcorrencia baseOcorrenciaCorpoBombeiros = new BaseOcorrencia();

    Emissor emissor = (Emissor) session.getAttribute("emissor");

    baseOcorrenciaCorpoBombeiros.setLogradouro(request.getParameter("ocorrencia_corpo_de_bombeiros_logradouro"));
    baseOcorrenciaCorpoBombeiros.setRua(request.getParameter("ocorrencia_corpo_de_bombeiros_rua"));
    baseOcorrenciaCorpoBombeiros.setCep(Integer.parseInt(request.getParameter("ocorrencia_corpo_de_bombeiros_cep")));
    baseOcorrenciaCorpoBombeiros.setNumeroResidencia(Integer.parseInt(request.getParameter("ocorrencia_corpo_de_bombeiros_numero_residencia")));
    baseOcorrenciaCorpoBombeiros.setBaseTipoOcorrencia(TipoOcorrenciaCorpoDeBombeirosDAO.buscarCBPorID(Integer.parseInt(request.getParameter("ocorrencia_corpo_de_bombeiros"))));
    baseOcorrenciaCorpoBombeiros.setEmissor(emissor);
    int codigo = OcorrenciaCorpoDeBombeirosDAO.inserir(baseOcorrenciaCorpoBombeiros);
    if(codigo > 0){
        response.sendRedirect("tela_escolher_ocorrencia.jsp?id=" + codigo);
    }else{

    }


%>

