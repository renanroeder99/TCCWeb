<%@ page import="model.Receptor" %><%--
  Created by IntelliJ IDEA.
  User: wanderson
  Date: 14/09/2017
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastrar Receptor</title>
    <link rel="stylesheet" type="text/css" href="css/tela_receptor_cadastrar.css">
    <%
        if(session.getAttribute("receptor") == null){
            response.sendRedirect("tela_usuario_login.jsp");
            return;
        }
        Receptor receptorLogado = (Receptor) session.getAttribute("receptor");
    %>
    <style type="text/css">
        body {
            width: 800px;
            height: 600px;
        }
    </style>
</head>
<body>

<form action="receptor_acao_cadastrar.jsp" method="POST">

    <div id="caixa-cadastrar-externa">
        <div id="caixa-cadastro-interno">
            <div id="caixa-cadastrar-label">Cadastrar Receptor</div>

        <div class="input-div">
        <input id="receptor-nome" type="text" name="receptor-nome" placeholder="Nome Completo" required="required"/>
    </div>

            <div class="input-div">
                <input id="receptor-cpf" name="receptr-cpf" type="CPF" placeholder="CPF" required="required"/>
            </div>

            <div class="input-div">
                <input id="receptor-email" name="receptor-email" type="Email"placeholder="Email" required="required"/>
            </div>

            <div class="input-div">
                <input id="receptor-senha" name = "receptor-senha" type="password" placeholder="Senha" required="required"/>
            </div>

            <div class="input-div">
                <input id="receptor-telefone" name="receptor-telefone" type="number" placeholder="Telefone" required="required"/>

            </div>

            <div class="input-div">
                <input id="receptor-endereco" name="receptor-endereco" type="number" placeholder="Endereço" required="required"/>

            </div>

            <div class="input-div">
                <input id="receptor-cep" name="receptor-cep" type="number" placeholder="CEP" required="required"/>

            </div>
            <div>

                <input type="radio" id="receptor-medico" name="receptor-cargo" value="MED" required="required">
                <label for="receptor-medico">Médico</label><br>

                <input type="radio" id="receptor-bombeiros" name="receptor-cargo" value ="CDB" required="required">
                <label for="receptor-bombeiros">Bombeiros</label><br>

                <input type="radio" id="receptor-defesa-civil" name="receptor-cargo" value="DFC" required="required">
                <label for="receptor-defesa-civil">Defesa Civil</label><br>

                <input type="radio" id="receptor-policial" name="receptor-cargo" value="POL" required="required">
                <label for="receptor-policial">Policial</label><br>

            </div>

        <div id="botoes">
            <button type="submit" id="botao-cadastrar">Cadastrar</button>
        </div>

    </div>
    </div>
</form>
</body>
</html>
