<%@ page import="model.Emissor" %>
<%@ page import="dao.EmissorDAO" %><%--
  Created by IntelliJ IDEA.
  User: 98930
  Date: 12/09/2017
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="menu_superior.jsp"/>
<% Emissor emissor = EmissorDAO.buscarEmissorPorID(Integer.parseInt(request.getParameter("id"))); %>

<form action="usuario_acao_alterar.jsp?id=" method="POST">
    <div>
        <label for="usuario-nome-alterar">Nome completo</label>
        <input type="text" id="usuario-nome-alterar" name="usuario-nome" required="required" value="<%= emissor.getNome() %>">
    </div>
    <div>
        <label for="usuario-username-alterar">Nome de usuário</label>
        <input type="text" id="usuario-username-alterar" name="usuario-username" required="required" value="<%= emissor.getUsuario() %>">
    </div>
    <div>
        <label for="usuario-data-nascimento-alterar">Data de nascimento</label>
        <input type="date" id="usuario-data-nascimento-alterar" name="usuario-data-nascimento" required="required" value="<%= emissor.getDataNascimento()%>">
    </div>
    <div>
        <label for="usuario-email-alterar">Email</label>
        <input type="email" id="usuario-email-alterar" name="usuario-email" required="required" value="<%= emissor.getEmail() %>">
    </div>
    <div>
        <label for="usuario-confirmar-email-alterar">Confirmar email</label>
        <input type="email" id="usuario-confirmar-email-alterar" name="usuario-confirmar-email" required="required" value="<%= emissor.getConfirmarEmail() %>">
    </div>
    <div>
        <label for="usuario-senha-alterar">Senha</label>
        <input type="password" id="usuario-senha-alterar" name="usuario-senha" required="required" value="<%= emissor.getSenha()%>">
    </div>
    <div>
        <label for="usuario-confirmar-senha-alterar">Confirmar Senha</label>
        <input type="password" id="usuario-confirmar-senha-alterar" name="usuario-confirmar-senha" required="required" value="<%= emissor.getConfirmarSenha() %>">
    </div>
    <div>
        <label for="usuario-rg-alterar">RG</label>
        <input type="number" id="usuario-rg-alterar" name="usuario-rg" required="required" value="<%= emissor.getRg()%>">
    </div>
    <div>
        <label for="usuario-cpf-alterar">CPF</label>
        <input type="text" id="usuario-cpf-alterar" name="usuario-cpf" required="required" value="<%= emissor.getCpf()%>">
    </div>
    <div>
        <label for="usuario-cep-alterar">CEP</label>
        <input type="text" id="usuario-cep-alterar" name="usuario-cep" required="required" value="<%= emissor.getCep()%>">
    </div>
    <div>
        <label for="usuario-telefone-alterar">Telefone</label>
        <input type="text" id="usuario-telefone-alterar" name="usuario-telefone" required="required" value="<%= emissor.getTelefone()%>">
    </div>
    <div>
        <label for="usuario-endereco-alterar">Endereco</label>
        <input type="text" id="usuario-endereco-alterar" name="usuario-endereco" required="required" value="<%= emissor.getEndereco()%>">
    </div>
    <div>
        <label for="usuario-numero-residencia-alterar">Número de residência</label>
        <input type="number" id="usuario-numero-residencia-alterar" name="usuario-numero-residencia" required="required" value="<%= emissor.getNumeroResidencia()%>">
    </div>

    <button type="submit" onclick="" value="submit">Cadastrar</button>

</form>
</body>
</html>
