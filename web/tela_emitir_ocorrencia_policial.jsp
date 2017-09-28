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

    <link rel="stylesheet" type="text/css" href="css/menu_superior.css">
    <script src="lib/jquery-3.2.1.min.js" type=""></script>
    <script src="js/usuario-cadastrar.js"></script>

</head>
<body>


<form action="ocorrencia_policial.jsp" method="POST">

    <div id="nav">
        <ul>
            <li width='65' class="home"><a href='tela_usuario_escolher_ocorrencia.jsp' title='Página Incial'><img src='\css\imagens\home.png' width="40"/></a></li>


            <li width='65' class="sair"><a href='deslogar.jsp' title='Sair'><img src='\css\imagens\sair.png' width="39"/></a></li>

            <li width='65' class="medico"><a href='tela_emitir_ocorrencia_medica.jsp' title='Emitir Ocorrência Médica'><img src='\css\imagens\medico.png' width="39"/></a></li>

            <li width='65' class="defesa-civil"><a href='tela_emitir_ocorrencia_policial.jsp' title='Emitir Ocorrência Defesa Civil'><img src='\css\imagens\defesacivil.png' width="39"/></a></li>


            <li width='65' class="bombeiro"><a href='tela_emitir_ocorrencia_corpo_de_bombeiros.jsp.jsp' title='Emitir Ocorrência Bombeiros'><img src='\css\imagens\bombeiro.png' width="39"/></a></li>


        </ul>
    </div>


    <div id="caixa-cadastro-externa">
        <div id="caixa-cadastro-interno">
            <div id="caixa-ocorrencia-label">Ocorrência Policial</div>

            <div class="input-div">
                <input id="ocorrencia-policial-rua" name="ocorrencia-policial-rua" type="text" placeholder="Rua"required="required"/>
            </div>


            <div class="input-div">
                <input id="ocorrencia-policial-numero-residencia" name="ocorrencia-policial-numero-residencia" type="text" placeholder="N° Residência"required="required"/>
            </div>


            <div class="input-div">
                <input id="ocorrencia-policial-cep" name="ocorrencia-policial-cep" placeholder="CEP"required="required"/>
            </div>




            <div class="input-div">
                <textarea cols=80 id="ocorrencia-policial-descricao" rows="10" name="ocorrencia-policial-descricao" maxlength="500" wrap="hard" placeholder="Digite uma breve descrição do acontecimento! " required="required"></textarea>
            </div>
            <div class="input-div">
                <select name = "ocorrencia-policial-tipo-ocorrencia" id="ocorrencia-policial-tipo-ocorrencia" required="required">
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





</form>
</body>
</html>
