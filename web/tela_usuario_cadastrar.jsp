<%--
  Created by IntelliJ IDEA.
  User: Antony Henrique Vogel
  Date: 12/09/2017
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastro</title>
    <link rel="stylesheet" type="text/css" href="css/tela_usuario_cadastro.css">
    <script src="lib/jquery-3.2.1.min.js" type=""></script>
    <script src="js/usuario-cadastrar.js"></script>
</head>
<body>

<<<<<<< HEAD
<form action="usuario_acao_cadastrar.jsp" method="POST">
<div class="pai">
    <h1 class="cadastro">Cadastro</h1>
    <div class="nome">
        <label for="usuario-nome">Nome completo</label>
        <input type="text" id="usuario-nome" name="usuario-nome" required="required" style="height: 25px">
    </div>
    <div class="nome_usuario">
        <label for="usuario-username">Nome de usuário</label>
        <input type="text" id="usuario-username" name="usuario-username"  required="required">
    </div>
    <div class="data_nascimento">
        <label for="usuario-data-nascimento">Data de nascimento</label>
        <input type="date" id="usuario-data-nascimento" name="usuario-data-nascimento" required="required">
    </div>
    <div class="email">
        <label for="usuario-email">Email</label>
        <input type="email" id="usuario-email" name="usuario-email" required="required">
    </div>
    <div class="confirmar_email">
        <label for="usuario-confirmar-email">Confirmar email</label>
        <input type="email" id="usuario-confirmar-email" name="usuario-confirmar-email" required="required">
    </div>
    <div class="senha">
        <label for="usuario-senha">Senha</label>
        <input type="password" id="usuario-senha" name="usuario-senha" required="required">
    </div>
    <div class="confirmar_senha">
        <label for="usuario-confirmar-senha">Confirmar senha</label>
        <input type="password" id="usuario-confirmar-senha" name="usuario-confirmar-senha" required="required">
    </div>
    <div class="rg">
        <label for="usuario-rg">RG</label>
        <input type="number" id="usuario-rg" name="usuario-rg" required="required">
    </div>
    <div class="cpf">
        <label for="usuario-cpf">CPF</label>
        <input type="text" id="usuario-cpf" name="usuario-cpf" required="required">
    </div>
    </div>
    <div class="cep">
        <label for="usuario-cep">CEP</label>
        <input type="text" id="usuario-cep" name="usuario-cep" required="required">
    </div>
    <div class="telefone">
        <label for="usuario-telefone">Telefone</label>
        <input type="text" id="usuario-telefone" name="usuario-telefone" required="required">
    </div>
    <div class="endereço">
        <label for="usuario-endereco">Endereco</label>
        <input type="text" id="usuario-endereco" name="usuario-endereco"  required="required">
    </div>
    <div class="numero_residencia">
        <label for="usuario-numero-residencia">Número de residência</label>
        <input type="number" id="usuario-numero-residencia" name="usuario-numero-residencia" required="required">
=======
<form action="usuario_acao_cadastrar.jsp" method="POST"/>

    <div id="caixa-cadastro-externa">
        <div id="caixa-cadastro-interna">
            <div id="caixa-cadastro-label">Cadastro</div>

            <div class="input-div">
                <input id="usuario-nome" type="text" value="Digite seu Nome" onfocus="this.value='';"/>
            </div>

            <div class="input-div">
                <input id="usuario-data-nascimento" type="date"/>
            </div>

            <div class="input-div">
                <input  >

            </div>

        </div>
>>>>>>> de23a445705c6cd9dbc804e7419a3e08d43b393f
    </div>




</body>
</html>
