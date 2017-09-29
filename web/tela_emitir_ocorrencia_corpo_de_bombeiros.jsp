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
        return;
    }
    Emissor emissor = (Emissor) session.getAttribute("emissor");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ocorrência Corpo de Bombeiros</title>
    <link rel="stylesheet" type="text/css" href="css/tela_emitir_ocorrencia_corpo_de_bombeiros.css">
    <meta charset="UTF-8"/>

</head>
<body>


<form action="ocorrencia_corpo_de_bombeiros.jsp" method="POST">

    <div id="nav">
        <ul>
            <li width='65' class="home"><a href='tela_usuario_escolher_ocorrencia.jsp' title='Página Incial'><img src='\css\imagens\home.png' width="40"/></a></li>


            <li width='65' class="sair"><a href='tela_usuario_login.jsp' title='Sair'><img src='\css\imagens\sair.png' width="39"/></a></li>

            <li width='65' class="policial"><a href='tela_emitir_ocorrencia_policial.jsp' title='Emitir Ocorrência Policial'><img src='\css\imagens\policial.png' width="39"/></a></li>

            <li width='65' class="medico"><a href='tela_emitir_ocorrencia_medica.jsp' title='Emitir Ocorrência Médica'><img src='\css\imagens\medico.png' width="39"/></a></li>

            <li width='65' class="defesa-civil"><a href='tela_emitir_ocorrencia_defesa_civil.jsp' title='Emitir Ocorrência Defesa Cívil'><img src='\css\imagens\defesacivil.png' width="39"/></a></li>


        </ul>
    </div>



<div id="caixa-cadastro-externa">
    <div id="caixa-cadastro-interno">
        <div id="caixa-ocorrencia-label">Ocorrência Corpo de Bombeiros</div>

        <div class="input-div">
            <input id="ocorrencia-corpo_de_bombeiros-rua" name="ocorrencia-corpo_de_bombeiros-rua" required="required" type="text" placeholder="Rua"/>
        </div>


        <div class="input-div">
            <input id="ocorrencia-corpo_de_bombeiros-numero-residencia" name="ocorrencia-corpo_de_bombeiros-numero-residencia" required="required" type="text" placeholder="N° Residência"/>
        </div>


        <div class="input-div">
            <input id="ocorrencia-corpo_de_bombeiros-cep" name="ocorrencia-corpo_de_bombeiros-cep" required="required" type="text" placeholder="CEP"/>
        </div>


        <div class="input-div">
            <textarea cols=80 id="ocorrencia_corpo_de_bombeiros-descricao" name="ocorrencia_corpo_de_bombeiros-descricao" rows="10" maxlength="500" wrap="hard" placeholder="Digite uma breve descrição do acontecimento! " required="required"></textarea>
        </div>
        <div class="input-div">
            <select name = "ocorrencia-corpo_de_bombeiros-tipo-ocorrencia" id="ocorrencia-corpo_de_bombeiros-tipo-ocorrencia">
                <% ArrayList<BaseTipoOcorrencia> tipos = TipoOcorrenciaCorpoDeBombeirosDAO.buscarOcorrenciaCorpoDeBombeiros();%>
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




