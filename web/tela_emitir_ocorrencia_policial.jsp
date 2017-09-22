<%@ page import="model.BaseTipoOcorrencia" %>
<%@ page import="dao.TipoOcorrenciaPolicialDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Emissor" %>
<%@ page import="model.BaseOcorrencia" %><%--
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
    <title>Ocorrência Policial</title>
    <link rel="stylesheet" type="text/css" href="css/tela_emitir_ocorrencia_policial.css">
</head>
<body>
<jsp:include page="menu_superior_policial.jsp"/>


<form action="ocorrencia_policial.jsp" method="POST"/>

    <div id="caixa-cadastro-externa">
        <div id="caixa-cadastro-interno">
            <div id="caixa-ocorrencia-label">Ocorrência Policial</div>

            <div class="input-div">
                <input id="ocorrência-policial-rua" type="text" value="Digite o Endereço" onfocus="this.value='';" />
            </div>


            <div class="input-div">
                <input id="ocorrencia-policial-numero-residencia" type="text" value="N° Residência" onfocus="this.value='';" />
            </div>


            <div class="input-div">
                <input id="ocorrencia-policial-cep" value="Digite o Cep" type="text" onfocus="this.value='';"/>
            </div>




            <div class="input-div">
                <textarea cols=80 id="ocorrencia-policial-descricao" rows="10" name="opiniao" maxlength="500" wrap="hard" placeholder="Digite uma breve descrição do acontecimento! "></textarea>
            </div>
            <div class="input-div">
                <select name = "ocorrencia-policial-tipo-ocorrencia" id="ocorrencia-policial-tipo-ocorrencia">
                    <% ArrayList<BaseTipoOcorrencia> tipos = TipoOcorrenciaPolicialDAO.buscarOcorrenciaPolicial();%>
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






</body>
</html>
