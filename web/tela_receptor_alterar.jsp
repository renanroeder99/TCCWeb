<%@ page import="model.Receptor" %>
<%@ page import="dao.ReceptorDAO" %><%--
  Created by IntelliJ IDEA.
  User: 98961
  Date: 18/09/2017
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Alterar Receptor</title>
    <%
        if(session.getAttribute("receptor") == null){
            response.sendRedirect("tela_usuario_login.jsp");
            return;
        }
        Receptor receptorLogado = (Receptor) session.getAttribute("receptor");
    %>
</head>
<body>

<% Receptor receptor = ReceptorDAO.buscarReceptorPorID(Integer.parseInt(request.getParameter("id"))); %>

<form action="receptor_acao_cadastrar.jsp" method="POST">
    <div>
        <label for="receptor-nome">Nome Completo</label>
        <input type="text" id="receptor-nome" name="receptor-nome" required="required" value="<%= receptor.getNome() %>">
    </div>

    <div>
        <label for="receptor-cpf">CPF</label>
        <input type="text" id="receptor-cpf" name="receptor-cpf" required="required" value="<%= receptor.getCpf() %>">
    </div>

    <div>
        <label for="receptor-login">Login</label>
        <input type="text" id="receptor-login" name="receptor-login" required="required" value="<%= receptor.getLogin() %>">
    </div>
    <div>
        <label for="receptor-email">Email</label>
        <input type="text" id="receptor-email" name="receptor-email" required="required" value="<%= receptor.getEmail() %>">
    </div>

    <div>
        <label for="receptor-senha">Senha</label>
        <input type="password" id="receptor-senha" name="receptor-senha" required="required" value="<%= receptor.getSenha() %>">

    </div>

    <div>
        <label for="receptor-confirmar-senha">Confirmar Senha</label>
        <input type="password" id="receptor-confirmar-senha" name="receptor-confirmar-senha" required="required" value="<%= receptor.getConfirmarSenha() %>">
    </div>

    <div>
        <label for="receptor-telefone">Teleforne</label>
        <input type="text" id="receptor-telefone" name="receptor-telefone" required="required" value="<%= receptor.getTelefone() %>">
    </div>

    <div>
        <label for="receptor-endereco">Endereço</label>
        <input type="text" id="receptor-endereco" name="receptor-endereco" required="required" value="<%= receptor.getEndereco() %>">
    </div>

    <div>
        <label for="receptor-cep">CEP</label>
        <input type="text" id="receptor-cep" name="receptor-cep" required="required" value="<%= receptor.getCep() %>">
    </div>
    
    <div>

        <button type="submit" onclick="" value="submit">Cadastrar</button>

    </div>





</body>
</html>
