<%--
  Created by IntelliJ IDEA.
  User: wanderson
  Date: 14/09/2017
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="menu_superior.jsp"/>


<form action="receptor_acao_cadastrar.jsp" method="POST">
    <div>
        <label for="receptor-nome">Nome Completo</label>
        <input type="text" id="receptor-nome" name="receptor-nome">
    </div>

    <div>
        <label for="receptor-cpf">CPF</label>
        <input type="text" id="receptor-cpf" name="receptor-cpf">
    </div>

    <div>
        <label for="receptor-login">Login</label>
        <input type="text" id="receptor-login" name="receptor-login">
    </div>
    <div>
        <label for="receptor-email">Email</label>
        <input type="text" id="receptor-email" name="receptor-email">
    </div>

    <div>
        <label for="receptor-senha">Senha</label>
        <input type="password" id="receptor-senha" name="receptor-senha">

    </div>

    <div>
        <label for="receptor-confirmar-senha">Confirmar Senha</label>
        <input type="password" id="receptor-confirmar-senha" name="receptor-confirmar-senha">
    </div>

    <div>
        <label for="receptor-telefone">Teleforne</label>
        <input type="text" id="receptor-telefone" name="receptor-telefone">
    </div>

    <div>
        <label for="receptor-endereco">Endereço</label>
        <input type="text" id="receptor-endereco" name="receptor-endereco">
    </div>

    <div>
        <label for="receptor-cep">CEP</label>
        <input type="text" id="receptor-cep" name="receptor-cep">
    </div>

    <div>
    <label for="receptor-cargo">Cargo</label>
    <input type="text" id="receptor-cargo" name="receptor-cargo">
    </div>

</form>
</body>
</html>
