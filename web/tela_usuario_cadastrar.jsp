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
    <meta charset="UTF-8"/>
</head>
<body>


<form action="usuario_acao_cadastrar.jsp" method="POST">

   <div id="caixa-cadastrar-externa">
       <div id="caixa-cadastro-interno">
           <div id="caixa-cadastrar-label">Cadastro</div>

           <div class="input-div">
               <input id="usuario-nome" type="text" name="usuario-nome" placeholder="Nome" required="required"/>
           </div>


           <div class="input-div">
               <input id="usuario-email" name="usuario-email" type="email" placeholder="Email" required="required"/>
           </div>


           <div class="input-div">
           <input id="usuario-confirmar-email" name="usuario-confirmar-email" type="email"placeholder="Confirmar Email" required="required"/>
             </div>



           <div class="input-div">
               <input id="usuario-senha" name = "usuario-senha" type="password" placeholder="Senha" required="required"/>
           </div>

           <div class="input-div">
               <input id="usuario-cpf" name="usuario-cpf" type="number" placeholder="CPF" required="required"/>

           </div>

           <div class="input-div">
               <input id="usuario-rg" name="usuario-rg" type="number" placeholder="RG" required="required"/>

           </div>

           <div class="input-div">
               <label for="usuario-data-nascimento">Data Nascimento</label>
               <input id="usuario-data-nascimento" name="usuario-data-nascimento" type="date" required="required"/>
           </div>


           <div class="input-div">
             <input id="usuario-telefone" name="usuario-telefone" type="number" placeholder="Telefone" required="required"/>
         </div>

           <div class="input-div">
               <input id="usuario-cep" name="usuario-cep" type="number" placeholder="CEP" required="required"/>
           </div>




           <div class="input-div">
             <input id="usuario-endereco" name="usuario-endereco" type="text" placeholder="Endereço" required="required"/>
         </div>


           <div class="input-div">
               <input id="usuario-numero-residencia" name="usuario-numero-residencia" type="number" placeholder="N° Residência" required="required"/>
           </div>
       </div>


       <div id="botoes">
           <button type="submit" id="botao-cadastrar">Cadastrar</button>
       </div>

   </div>

</form>
</body>
</html>
