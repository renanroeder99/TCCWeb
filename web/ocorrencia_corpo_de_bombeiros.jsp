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

    baseOcorrenciaCorpoBombeiros.setRua(request.getParameter("ocorrencia-corpo_de_bombeiros-rua"));
    baseOcorrenciaCorpoBombeiros.setCep(request.getParameter("ocorrencia-corpo_de_bombeiros-cep"));
    baseOcorrenciaCorpoBombeiros.setNumeroResidencia(Integer.parseInt(request.getParameter("ocorrencia-corpo_de_bombeiros-numero-residencia")));
    baseOcorrenciaCorpoBombeiros.setBaseTipoOcorrencia(TipoOcorrenciaCorpoDeBombeirosDAO.buscarCBPorID(Integer.parseInt(request.getParameter("ocorrencia-corpo_de_bombeiros-tipo-ocorrencia"))));
    baseOcorrenciaCorpoBombeiros.setDescricao(request.getParameter("ocorrencia_corpo_de_bombeiros-descricao"));
    baseOcorrenciaCorpoBombeiros.setEmissor(emissor);

    int codigo = OcorrenciaCorpoDeBombeirosDAO.inserir(baseOcorrenciaCorpoBombeiros);
    if(codigo >= 0){ %>
        <script>mensagemOcorrenciaEmitida();</script>
<%
        response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");

    }else{

    }


%>

