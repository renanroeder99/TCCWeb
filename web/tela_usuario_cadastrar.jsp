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
<form action="usuario_acao_cadastrar.jsp" method="POST"/>

   <div id="caixa-cadastrar-externa">
       <div id="caixa-cadastro-interno">
           <div id
       </div>

   </div>

=======
<form action="usuario_acao_cadastrar.jsp" method="POST">
<div class="pai">
    <h1 class="cadastro">Cadastro</h1>
    <div>
        <label for="nome-usuario">Nome</label>
        <input type="text" id="nome-usuario" name="nome-usuario" required="required">
    </div>
    <div>
        <label for="data-usuario">Data De Nascimento</label>
        <input type="date" id="data-usuario" name="data-usuario" required="required">
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
>>>>>>> cc617742cf40e70338bc3691c58758dcfb80ecb1

</body>
</html>
