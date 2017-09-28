<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.TipoOcorrenciaMedicaDAO" %>
<%@ page import="model.BaseTipoOcorrencia" %>
<%@ page import="model.Emissor" %><%--
  Created by IntelliJ IDEA.
  User: Felipe de Jesus Cazagranda
  Date: 14/09/2017
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>

<%
    if(session.getAttribute("emissor") == null) {
        response.sendRedirect("tela_usuario_login.jsp");
        return;
    }
    Emissor emissor = (Emissor) session.getAttribute("emissor");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ocorrencia Médica</title>
    <link rel="stylesheet" type="text/css" href="css/tela_emitir_ocorrencia_medica.css">
    <link rel="stylesheet" type="text/css" href="css/menu_superior.css">
    <style type="text/css">
        body {
            width: 800px;
            height: 600px;
        }
    </style>
</head>
<body>
<jsp:include page="menu_superior_medico.jsp"/>

<form action="ocorrencia_medica.jsp" method="POST">
    <div id="caixa-cadastro-externa">
        <div id="caixa-cadastro-interno">
            <div id="caixa-ocorrencia-label">Ocorrência Médica</div>

            <div class="input-div">
                <input id="ocorrencia-medica-rua" name="ocorrencia-medica-rua" type="text" placeholder="Rua" required="required"/>
            </div>

            <div class="input-div">
                <input id="ocorrencia-medica-numero-residencia" name="ocorrencia-medica-numero-residencia" type="text" placeholder="N° Residência"required="required"/>
            </div>

            <div class="input-div">
                <input id="ocorrencia-medica-cep" name="ocorrencia-medica-cep" placeholder="CEP" required="required"/>
            </div>

            <div class="input-div">
                <textarea cols=80 id="ocorrencia-medica-descricao" rows="10" name="opiniao" maxlength="500" wrap="hard" placeholder="Digite uma breve descrição do acontecimento! "></textarea>
            </div>
            <div class="input-div">
                <select name = "ocorrencia-medica-tipo-ocorrencia" id="ocorrencia-medica-tipo-ocorrencia" required="required">
                    <% ArrayList<BaseTipoOcorrencia> tipos = TipoOcorrenciaMedicaDAO.buscarOcorrenciaMedica();%>
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
