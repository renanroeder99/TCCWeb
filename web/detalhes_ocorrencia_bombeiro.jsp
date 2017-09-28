<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.OcorrenciaCorpoDeBombeirosDAO" %>
<%@ page import="model.Emissor" %>
<%@ page import="model.Receptor" %><%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 19/09/2017
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/detalhes_corpo_de_bombeiro.css">
    <title>Detalhes da ocorrencia</title>
    <%
        if(session.getAttribute("receptor") == null){
            response.sendRedirect("tela_usuario_login.jsp");
            return;
        }
        Receptor receptor = (Receptor) session.getAttribute("receptor");
    %>

</head>
<body>


    <%BaseOcorrencia ocorrencia = OcorrenciaCorpoDeBombeirosDAO.buscarOcorrenciaBombeiroPorId(Integer.parseInt(request.getParameter("id")));%>

<div id="caixa-detalhe">
    <div id="caixa-detalhe-interna">
        <div id="caixa-detalhe-label">Detalhe da Ocorrência</div>

        <div class="nome">
            <h4>Nome:  <%=ocorrencia.getEmissor().getNome()%>  </h4>
        </div>

        <div class="ocorrencia">
            <h4>Ocorrencia:  <%=ocorrencia.getBaseTipoOcorrencia().getTipo()%> </h4>
        </div>

        <div class="descricao">
            <h4>Descrição:  <%=ocorrencia.getDescricao()%>  </h4>
        </div>

        <div class="telefone">
            <h4>Telefone:  <%=ocorrencia.getEmissor().getTelefone()%> </h4>
        </div>

        <div class="rg">
            <h4>RG:  <%=ocorrencia.getEmissor().getRg()%>  </h4>
        </div>

        <div class="cpf">
            <h4>CPF:  <%=ocorrencia.getEmissor().getCpf()%>  </h4>
        </div>

        <div class="endereco">
            <h4>Endereço:   <%=ocorrencia.getEmissor().getEndereco()%>  </h4>
        </div>

        <div class="email">
            <h4>Email:  <%=ocorrencia.getEmissor().getEmail()%> </h4>
        </div>
    </div>
</div>

<a  href="excluir_ocorrencia_bombeiro.jsp?id=<%=ocorrencia.getId()%>">Excluir a ocorrência</a>



</body>
</html>
