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
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/tela_usuario_cadastro.css">
    <script src="lib/jquery-3.2.1.min.js" type=""></script>
    <script src="js/usuario-cadastrar.js"></script>
</head>
<body>

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
    </div>




</body>
</html>
