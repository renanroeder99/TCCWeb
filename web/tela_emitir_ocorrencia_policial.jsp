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
    <title>Title</title>
</head>
<body>
<jsp:include page="menu_superior.jsp"/>

<form action="ocorrencia_policial_acao_emitir.jsp" method="POST">
    <div>
        <label for="ocorrencia-policial-cep">Cep</label>
        <input type="text" id="ocorrencia-policial-cep" name="ocorrencia-policial-cep">
    </div>
    <div>
        <label for="ocorrencia-policial-rua">Rua</label>
        <input type="text" id="ocorrencia-policial-rua" name="ocorrencia-policial-rua">
    </div>
    
    <div>
        <label for="ocorrencia-policial-numero-residencia">Número Residência</label>
        <input type="text" id="ocorrencia-policial-numero-residencia" name="ocorrencia-policial-numero-residencia">
    </div>

    <div>
        <label>Tipo Ocorrencia</label>
        <select>
            <% ArrayList<BaseTipoOcorrencia> tipos = TipoOcorrenciaPolicialDAO.buscarOcorrenciaPolicial();%>
            <% for (BaseTipoOcorrencia tipoOcorrencia : tipos) { %>
            <option value="<%= tipoOcorrencia.getId() %>"><%= tipoOcorrencia.getTipo() %>
            </option>
            <% } %>
        </select>
    </div>

    <div>
        <label for="ocorrencia-policial-descricao">Descrição</label>

    </div>
    <div>

        <textarea name="Descrição" id="ocorrencia-policial-descricao" cols="30" rows="10"></textarea>



    <button type="submit">Concluir</button>


    </div>


    
</form>

</body>
</html>
