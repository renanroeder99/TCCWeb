<%@ page import="model.BaseTipoOcorrencia" %>
<%@ page import="dao.TipoOcorrenciaCorpoDeBombeirosDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Emissor" %><%--
  Created by IntelliJ IDEA.
  User: Daiane Machado
  Date: 14/09/2017
  Time: 13:48
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
    <title>Ocorrencia Corpo de Bombeiros</title>
    <link rel="stylesheet" type="text/css" href="css/tela_emitir_ocorrencia_corpo_de_bombeiros.css">
</head>
<body>
<jsp:include page="menu_superior_corpo_de_bombeiros.jsp">;

<h1 align="center">Ocorrência Corpo de Bombeiros</h1>

<form action="ocorrencia_corpo_de_bombeiros.jsp" method="POST">

    <div>
        <br>
        <label for="ocorrencia_corpo_de_bombeiros_rua" class="label-cadastro">Rua</label>
        <input type="text" id="ocorrencia_corpo_de_bombeiros_rua" name="ocorrencia_corpo_de_bombeiros_rua">
    </div>
    <div>
        <br>
        <label for="ocorrencia_corpo_de_bombeiros_cep" class="label-cadastro">CEP</label>
        <input type="text" id="ocorrencia_corpo_de_bombeiros_cep" name="ocorrencia_corpo_de_bombeiros_cep">
    </div>
    <div>
        <br>
        <label for="ocorrencia_corpo_de_bombeiros_numero_residencia" class="label-cadastro">Número da Residência</label>
        <input type="text" id="ocorrencia_corpo_de_bombeiros_numero_residencia" name="ocorrencia_corpo_de_bombeiros_numero_residencia">
    </div>
    <div>
        <br>
        <label class="label-cadastro">Tipo da Ocorrência</label>
        <select>
            <% ArrayList<BaseTipoOcorrencia> tipos = TipoOcorrenciaCorpoDeBombeirosDAO.buscarOcorrenciaCorpoDeBombeiros();%>
            <% for (BaseTipoOcorrencia tipoOcorrencia : tipos) { %>
            <option value="<%= tipoOcorrencia.getId() %>"><%= tipoOcorrencia.getTipo() %>
            </option>
            <% } %>
        </select>
    </div>
    <br>
    <label for="descricao" class="label-cadastro">Descrição</label>
    <div>
    </div>
    <textarea name="descricao" id="descricao" cols="30" rows="10"></textarea>

    <button type="submit">Emitir</button>
</form>
</body>
</html>