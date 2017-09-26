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
    <%
        if(session.getAttribute("receptor") == null){
            response.sendRedirect("tela_usuario_login.jsp");
            return;
        }
        Receptor receptorLogado = (Receptor) session.getAttribute("receptor");
    %>
</head>
<body>

<form action="receptor_acao_cadastrar.jsp" method="POST">
    <div>
        <label for="receptor-nome">Nome Completo</label>
        <input type="text" name="receptor-nome" id="receptor-nome" name="receptor-nome">
    </div>

    <div>
        <label for="receptor-cpf">CPF</label>
        <input type="text" name="receptor-cpf" id="receptor-cpf" name="receptor-cpf">
    </div>

    <div>
        <label for="receptor-email">Email</label>
        <input type="text" name="receptor-email" id="receptor-email" name="receptor-email">
    </div>

    <div>
        <label for="receptor-senha">Senha</label>
        <input type="password" name="receptor-senha" id="receptor-senha" name="receptor-senha">

    </div>

    <div>
        <label for="receptor-confirmar-senha">Confirmar Senha</label>
        <input type="password" name="receptor-confirmar-senha" id="receptor-confirmar-senha" name="receptor-confirmar-senha">
    </div>

    <div>
        <label for="receptor-telefone">Teleforne</label>
        <input type="text" name="receptor-telefone" id="receptor-telefone" name="receptor-telefone">
    </div>

    <div>
        <label for="receptor-endereco">Endereço</label>
        <input type="text" name="receptor-endereco" id="receptor-endereco" name="receptor-endereco">
    </div>

    <div>
        <label for="receptor-cep">CEP</label>
        <input type="text" name="receptor-cep" id="receptor-cep" name="receptor-cep">
    </div>


    <div>

        <input type="radio" id="receptor-medico" name="cadastro-cargo" value="MED" required="required">
        <label for="receptor-medico">Médico (MED_seuusename)</label><br>

        <input type="radio" id="receptor-bombeiros" name="cadastro-cargo" value ="CDB" required="required">
        <label for="receptor-bombeiros">Bombeiros (CDB_seuusername)</label><br>

        <input type="radio" id="receptor-defesa-civil" name="cadastro-cargo" value="DFC" required="required">
        <label for="receptor-defesa-civil">Defesa Civil (DFC_seuusername)</label><br>

        <input type="radio" id="receptor-policial" name="cadastro-cargo" value="POL" required="required">
        <label for="receptor-policial">Policial (POL_seuusername)</label><br>

    </div>


    <div>

        <button type="submit" onclick="" value="submit">Cadastrar</button>

    </div>


</form>
</body>
</html>
