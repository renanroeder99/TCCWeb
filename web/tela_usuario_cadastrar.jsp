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


<form action="usuario_acao_cadastrar.jsp" method="POST"/>

   <div id="caixa-cadastrar-externa">
       <div id="caixa-cadastro-interno">
           <div id="caixa-cadastrar-label">Cadastro</div>

           <div class="input-div">
               <input id="usuario-nome" type="text" value="Nome" onfocus="this.value='';" />
           </div>
           <div class="input-div">
               <label for="usuario-data-nascimento">Data Nascimento</label>
               <input id="usuario-data-nascimento" type="date"/>
           </div>
           <div class="input-div">
               <input id="usuario-email" type="email" value="Email" onfocus="this.value='';" />
           </div>
           <div class="input-div">
           <input id="usuario-confirmar-email" type="email" value="Confirmar Email" onfocus="this.value='';" />
             </div>

           <div class="input-div">
               <input id="usuario-senha" type="password" value="Senha" onfocus="this.value='';" />
           </div>
           <div class="input-div">
               <input id="usuario-rg" type="text" value="RG" onfocus="this.value='';" />

           </div>
           <div class="input-div">
               <input id="usuario-cpf" type="text" value="CPF" onfocus="this.value='';" />

           </div>
           <div class="input-div">
               <input id="usuario-cep" type="text" value="CEP" onfocus="this.value='';" />
           </div>
         <div class="input-div">
             <input id="usuario-telefone" type="text" value="Telefone" onfocus="this.value='';" />
         </div>
         <div class="input-div">
             <input id="usuario-endereco" type="text" value="Endereço" onfocus="this.value='';" />
         </div>
           <div class="input-div">
               <input id="usuario-numero-residencia" type="text" value="Número Residência" onfocus="this.value='';" />
           </div>
       </div>
       <div id="botoes">
           <button id="botao" type="submit" title="Fazer o Cadastro">Cadastrar</button>
       </div>

   </div>


</body>
</html>
