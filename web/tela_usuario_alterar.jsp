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
    <title>Alterar Informações</title>
    <link rel="stylesheet" type="text/css" href="css/tela_alterar_usuario.css">
    <meta charset="UTF-8"/>
</head>
<body>
<jsp:include page="verificar_login.jsp"/>
<% Emissor emissor = EmissorDAO.buscarEmissorPorID(Integer.parseInt(request.getParameter("id"))); %>

<form action="usuario_acao_alterar.jsp?id=" method="POST">

    <div id="caixa-cadastrar-externa">
        <div id="caixa-cadastro-interno">
            <div id="caixa-cadastrar-label">Alterar Cadastro</div>

            <div class="input-div">
                <input id="usuario-nome" name="usuario-nome" type="text" placeholder="Nome" value="<%=emissor.getNome()%>">
            </div>
            <div class="input-div">
                <label for="usuario-data-nascimento">Data Nascimento</label>
                <input id="usuario-data-nascimento" name="usuario-data-nascimento" type="date" value="<%=emissor.getDataNascimento()%>">
            </div>
            <div class="input-div">
                <input id="usuario-email" name="usuario-email" type="email" placeholder="Email" value="<%=emissor.getEmail()%>">
            </div>
            <div class="input-div">
                <input id="usuario-confirmar-email" name="usuario-confirmar-email" type="email"placeholder="Confirmar Email" value="<%=emissor.getConfirmarEmail()%>">
            </div>

            <div class="input-div">
                <input id="usuario-senha" name="usuario-senha" type="password" placeholder="Senha" value="<%=emissor.getSenha()%>">
            </div>
            <div class="input-div">
                <input id="usuario-rg" name="usuario-rg" type="text" placeholder="RG" value="<%=emissor.getRg()%>">

            </div>
            <div class="input-div">
                <input id="usuario-cpf"  name="usuario-cpf" type="text" placeholder="CPF" value="<%=emissor.getCpf()%>">

            </div>
            <div class="input-div">
                <input id="usuario-cep"  name="usuario-cep" type="text" placeholder="CEP" value="<%=emissor.getCep()%>">
            </div>
            <div class="input-div">
                <input id="usuario-telefone"  name="usuario-telefone" type="text" placeholder="Telefone" value="<%=emissor.getTelefone()%>">
            </div>
            <div class="input-div">
                <input id="usuario-endereco" name="usuario-endereco" type="text" placeholder="Endereço" value="<%=emissor.getEndereco()%>">
            </div>
            <div class="input-div">
                <input id="usuario-numero-residencia" name="usuario-numero-residencia" type="text" placeholder="N° Residência" value="<%=emissor.getNumeroResidencia()%>">
            </div>
        </div>
        <div id="botoes">
            <button type="submit" id="botao-alterar">Alterar</button>
        </div>

    </div>

</form>
</body>
</html>
