<%@ page import="model.Emissor" %>
<%@ page import="dao.EmissorDAO" %>
<%@ page import="database.Utilitario" %><%--
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
    <script src="lib/jquery-3.2.1.min.js" type=""></script>
    <script src="js/usuario-cadastrar.js"></script>
    <meta charset="UTF-8"/>
    <script src="js/jquery.mask.min.js" type=""></script>
    <script>
        jQuery(function($){

            $("#usuario-telefone").mask("9999-9999");
            $("#usuario-cep").mask("99999-999");
            $("#usuario-cpf").mask("999.999.999-99");

        });
    </script>

</head>
<body>
<jsp:include page="verificar_login.jsp"/>
<% Emissor emissor = EmissorDAO.buscarEmissorPorID(Integer.parseInt(request.getParameter("id"))); %>

<form action="usuario_acao_alterar.jsp?" method="POST">

    <div id="caixa-cadastrar-externa">
        <div id="caixa-cadastro-interno">
            <div id="caixa-cadastrar-label">Alterar Cadastro</div>
            <input type="hidden" name="usuario-id" value="<%=emissor.getId()%>">
            <div class="input-div">
                <input id="usuario-nome" name="usuario-nome" type="text" placeholder="Nome" required="required" value="<%=emissor.getNome()%>">
            </div>
            <div class="input-div">
                <label for="usuario-data-nascimento">Data Nascimento</label>
                <input id="usuario-data-nascimento" name="usuario-data-nascimento" type="date" required="required" value="<%=emissor.getDataNascimento()%>" >
            </div>
            <div class="input-div">
                <input id="usuario-email" name="usuario-email" type="email" required="required" placeholder="Email" value="<%=emissor.getEmail()%>">
            </div>
            <div class="input-div">
                <input id="usuario-confirmar-email" name="usuario-confirmar-email" type="email" required="required" placeholder="Confirmar Email" value="<%=emissor.getEmail()%>">
            </div>

            <div class="input-div">
                <input id="usuario-senha" name="usuario-senha" type="password" required="required" placeholder="Senha">
            </div>
            <div class="input-div">
                <input id="usuario-rg" name="usuario-rg" type="text" placeholder="RG" required="required" value="<%=emissor.getRg()%>">

            </div>
            <div class="input-div">
                <input id="usuario-cpf"  name="usuario-cpf" type="text" placeholder="CPF" required="required" value="<%=emissor.getCpf()%>">

            </div>
            <div class="input-div">
                <input id="usuario-cep"  name="usuario-cep" type="text" placeholder="CEP" required="required" value="<%=emissor.getCep()%>">
            </div>
            <div class="input-div">
                <input id="usuario-telefone"  name="usuario-telefone" type="text" placeholder="Telefone" required="required" value="<%=emissor.getTelefone()%>">
            </div>
            <div class="input-div">
                <input id="usuario-endereco" name="usuario-endereco" type="text" placeholder="Endereço" required="required" value="<%=emissor.getEndereco()%>">
            </div>
            <div class="input-div">
                <input id="usuario-numero-residencia" name="usuario-numero-residencia" type="text" placeholder="N° Residência" required="required" value="<%=emissor.getNumeroResidencia()%>">
            </div>
        </div>
        <div id="botoes">
            <button type="submit" id="botao-alterar">Alterar</button>
        </div>

    </div>

</form>
</body>
</html>
