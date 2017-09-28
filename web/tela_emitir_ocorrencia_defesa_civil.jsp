<%@ page import="model.BaseTipoOcorrencia" %>
<%@ page import="dao.TipoOcorrenciaPolicialDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Emissor" %>
<%@ page import="model.BaseOcorrencia" %>
<%@ page import="dao.TipoOcorrenciaDefesaCivilDAO" %><%--
  Created by IntelliJ IDEA.
  User: 98961
  Date: 14/09/2017
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%
    if(session.getAttribute("emissor") == null){
        response.sendRedirect("tela_usuario_login.jsp");
        return;
    }
    Emissor emissor = (Emissor) session.getAttribute("emissor");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ocorrência Desefa Civil</title>
    <link rel="stylesheet" type="text/css" href="css/tela_emitir_ocorrencia_defesa_civil.css">
    <link rel="stylesheet" type="text/css" href="css/menu_superior.css">
    <style type="text/css">
        body {
            width: 800px;
            height: 600px;
        }
    </style>
</head>
<body>
<jsp:include page="menu_superior_defesa_civil.jsp"/>


<form action="ocorrencia_defesa_civil.jsp" method="POST">

<div id="caixa-cadastro-externa">
    <div id="caixa-cadastro-interno">
        <div id="caixa-ocorrencia-label">Ocorrência Defesa Civil</div>

        <div class="input-div">
            <input id="ocorrência-defesa-rua" name="ocorrência-defesa-rua" type="text" placeholder="Rua" required="required"/>
        </div>


        <div class="input-div">
            <input id="ocorrencia-defesa-numero-residencia" name="ocorrencia-defesa-numero-residencia" placeholder="N° Residência" required="required" />
        </div>


        <div class="input-div">
            <input id="ocorrencia-defesa-cep" name="ocorrencia-defesa-cep" placeholder="CEP" required="required"/>
        </div>




        <div class="input-div">
            <textarea cols=80 id="ocorrencia-defesa-descricao" name="ocorrencia-defesa-descricao" rows="10" name="opiniao" maxlength="500" wrap="hard" placeholder="Digite uma breve descrição do acontecimento! "></textarea>
        </div>
        <div class="input-div">
            <select name = "ocorrencia-defesa-tipo-ocorrencia" id="ocorrencia-defesa-tipo-ocorrencia" required="required">
                <% ArrayList<BaseTipoOcorrencia> tipos = TipoOcorrenciaDefesaCivilDAO.buscarOcorrenciaDefesaCivil();%>
                <% for (BaseTipoOcorrencia tipoOcorrencia : tipos) { %>
                <option value="<%= tipoOcorrencia.getId() %>"><%= tipoOcorrencia.getTipo() %>
                </option>
                <% } %>
            </select>
        </div>

        <div id="botoes">
            <button id="botao" type="submit" title="Enviar Ocorrência">Emitir</button>

        </div>

    </div>
</div>





</form>
</body>
</html>
