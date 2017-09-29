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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ocorrencia Médica</title>
    <link rel="stylesheet" type="text/css" href="css/tela_emitir_ocorrencia_medica.css">
    <%
        if(session.getAttribute("emissor") == null) {
            response.sendRedirect("tela_usuario_login.jsp");
            return;
        }
        Emissor emissor = (Emissor) session.getAttribute("emissor");
    %>
    <meta charset="UTF-8"/>
</head>
<body>


<form action="ocorrencia_medica.jsp" method="POST">

    <div id="nav">
        <ul>
            <li width='65' class="home"><a href='tela_usuario_escolher_ocorrencia.jsp' title='Página Incial'><img src='\css\imagens\home.png' width="40"/></a></li>


            <li width='65' class="sair"><a href='tela_usuario_login.jsp' title='Sair'><img src='\css\imagens\sair.png' width="39"/></a></li>

            <li width='65' class="policial"><a href='tela_emitir_ocorrencia_policial.jsp' title='Emitir Ocorrência Policial'><img src='\css\imagens\policial.png' width="39"/></a></li>

            <li width='65' class="defesa-civil"><a href='tela_emitir_ocorrencia_defesa_civil.jsp' title='Emitir Ocorrência Defesa Civil'><img src='\css\imagens\defesacivil.png' width="39"/></a></li>


            <li width='65' class="bombeiro"><a href='tela_emitir_ocorrencia_corpo_de_bombeiros.jsp' title='Emitir Ocorrência Bombeiros'><img src='\css\imagens\bombeiro.png' width="39"/></a></li>


        </ul>
    </div>

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
                <textarea cols=80 id="ocorrencia-medica-descricao" rows="10" name="ocorrencia-medica-descricao" maxlength="500" wrap="hard" placeholder="Digite uma breve descrição do acontecimento! " required="required"></textarea>
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
