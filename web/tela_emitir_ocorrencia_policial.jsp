<%@ page import="model.BaseTipoOcorrencia" %>
<%@ page import="dao.TipoOcorrenciaPolicialDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Emissor" %><%--
  Created by IntelliJ IDEA.
  User: 98961
  Date: 14/09/2017
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%
    if(session.getAttribute("emissor") == null){
        response.sendRedirect("tela_usuario_login.jsp");
    }
    Emissor emissor = (Emissor) session.getAttribute("emissor");
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ocorrência Policial</title>
    <link rel="stylesheet" type="text/css" href="css/tela_emitir_ocorrencia_corpo_de_bombeiros.css">
</head>
<body>
<h1 align="center">Ocorrência Policial</h1>

<form action="ocorrencia_policial.jsp" method="POST">
    <div>
        <br>
        <label for="ocorrencia-policial-rua" class="label-cadastro">Rua</label>
        <input type="text" id="ocorrencia-policial-rua" name="ocorrencia-policial-rua">
    </div>
    <br>
    <div>
        <label for="ocorrencia-policial-cep" class="label-cadastro">CEP</label>
        <input type="text" id="ocorrencia-policial-cep" name="ocorrencia-policial-cep">
    </div>
    <br>
    <div>
        <label for="ocorrencia-policial-numero-residencia" class="label-cadastro">Número da Residência</label>
        <input type="text" id="ocorrencia-policial-numero-residencia" name="ocorrencia-policial-numero-residencia">
    </div>
    <br>
    <div>
        <label class="label-cadastro">Tipo da Ocorrência</label>
        <select>
            <% ArrayList<BaseTipoOcorrencia> tipos = TipoOcorrenciaPolicialDAO.buscarOcorrenciaPolicial();%>
            <% for (BaseTipoOcorrencia tipoOcorrencia : tipos) { %>
            <option value="<%= tipoOcorrencia.getId() %>"><%= tipoOcorrencia.getTipo() %>
            </option>
            <% } %>
        </select>
    </div>
    <br>
    <div>
        <label for="ocorrencia-policial-descricao" class="label-cadastro">Descrição</label>
    </div>
    <div>
        <textarea name="Descrição" id="ocorrencia-policial-descricao" cols="30" rows="10"></textarea>

        <button type="submit">Emitir</button>
    </div>
</form>
</body>
</html>
