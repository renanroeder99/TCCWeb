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
    <title>Title</title>
</head>
<body>
<jsp:include page="menu_superior.jsp"/>

<form action="ocorrencia_corpo_de_bombeiros.jsp" method="POST">

    <div>
        <label for="ocorrencia_corpo_de_bombeiros_rua">Rua</label>
        <input type="text" id="ocorrencia_corpo_de_bombeiros_rua" name="ocorrencia_corpo_de_bombeiros_rua">
    </div>

    <div>
        <label for="ocorrencia_corpo_de_bombeiros_cep">CEP</label>
        <input type="text" id="ocorrencia_corpo_de_bombeiros_cep" name="ocorrencia_corpo_de_bombeiros_cep">
    </div>

    <div>
        <label for="ocorrencia_corpo_de_bombeiros_numero_residencia">Numero_Residencia</label>
        <input type="text" id="ocorrencia_corpo_de_bombeiros_numero_residencia" name="ocorrencia_corpo_de_bombeiros_numero_residencia">
    </div>
<<<<<<< HEAD
    <div>
        <label>Tipo Ocorrencia</label>
        <select>
            <% ArrayList<BaseTipoOcorrencia> tipos = TipoOcorrenciaCorpoDeBombeirosDAO.buscarOcorrenciaCorpoDeBombeiros();%>
            <% for (BaseTipoOcorrencia tipoOcorrencia : tipos) { %>
            <option value="<%= tipoOcorrencia.getId() %>"><%= tipoOcorrencia.getTipo() %>
            </option>
            <% } %>
        </select>
</div>
    </div>
    <label for="descricao">Descricao</label>
    <div>
    </div>
    <textarea name="descricao" id="descricao" cols="30" rows="10"></textarea>
=======

>>>>>>> 4414bbf815df99e7a4ef22b41ce681a056f3defd
    <button type="submit">Cadastrar</button>
</form>
</body>
</html>
