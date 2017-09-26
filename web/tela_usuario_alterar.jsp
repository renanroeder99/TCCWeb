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
                <input id="usuario-nome" type="text" placeholder="Nome"/>
            </div>
            <div class="input-div">
                <label for="usuario-data-nascimento">Data Nascimento</label>
                <input id="usuario-data-nascimento" type="date"/>
            </div>
            <div class="input-div">
                <input id="usuario-email" type="email" placeholder="Email"/>
            </div>
            <div class="input-div">
                <input id="usuario-confirmar-email" type="email"placeholder="Confirmar Email" />
            </div>

            <div class="input-div">
                <input id="usuario-senha" type="password" placeholder="Senha" />
            </div>
            <div class="input-div">
                <input id="usuario-rg" type="text" placeholder="RG"/>

            </div>
            <div class="input-div">
                <input id="usuario-cpf" type="text" placeholder="CPF" />

            </div>
            <div class="input-div">
                <input id="usuario-cep" type="text" placeholder="CEP"/>
            </div>
            <div class="input-div">
                <input id="usuario-telefone" type="text" placeholder="Telefone" />
            </div>
            <div class="input-div">
                <input id="usuario-endereco" type="text" placeholder="Endereço" />
            </div>
            <div class="input-div">
                <input id="usuario-numero-residencia" type="text" placeholder="N° Residência" />
            </div>
        </div>
        <div id="botoes">
            <button type="submit" id="botao-alterar">Alterar</button>
        </div>

    </div>

</form>
</body>
</html>
