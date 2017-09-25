<%@ page import="model.Emissor" %>
<%@ page import="database.Conexao" %>
<%@ page import="model.Receptor" %><%--
  Created by IntelliJ IDEA.
  User: Antony Henrique Vogel
  Date: 14/09/2017
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    if (session.getAttribute("receptor") != null) {
            response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
            Receptor receptor = (Receptor) session.getAttribute("receptor");
            switch (receptor.getCargo()) {
                case "MED":
                    response.sendRedirect("tela_receptor_medico.jsp");
                    break;
                case "DFC":
                    response.sendRedirect("tela_receptor_defesa_civil.jsp");
                    break;
                case "CDB":
                    response.sendRedirect("tela_receptor_bombeiro.jsp");
                    break;
                case "POL":
                    response.sendRedirect("tela_receptor_policial.jsp");
                    break;
            }
            return;
        }
        if (session.getAttribute("emissor") == null) {
            response.sendRedirect("tela_usuario_login.jsp");
            return;
    }
    Emissor emissor = (Emissor) session.getAttribute("emissor");
%>


<html>
<head>
    <title>Escolher Ocorrência</title>
    <link rel="stylesheet" type="text/css" href="css/tela_usuario_escolher_ocorrencia.css">
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/css/font-awesome.min.css">

</head>
<body>
<h3 align="center">Bem Vindo <%=emissor.getUsuario()%>! , <a href="" id="sair">Sair</a></h3>


<div id="caixa-escolher">

    <div id="caixa-escolher-interna">

        <div id="caixa-escolher-label">Escolha a Ocorrência</div>

        <div id="botoes">
            <a href="tela_emitir_ocorrencia_policial.jsp"><button id="ocorrencia-policial">Ocorrência Policial</button></a>




            <a href="tela_emitir_ocorrencia_medica.jsp"><button id="ocorrencia-medica">Ocorrência Médica</button></a>




            <a href="tela_emitir_ocorrencia_corpo_de_bombeiros.jsp"><button id="ocorrencia-bombeiros">Corpo de Bombeiros</button></a>



            <a href="tela_emitir_ocorrencia_defesa_civil.jsp"><button id="ocorrencia-defesa-civil">Defesa Cívil</button></a>
        </div>

    </div>
</div>

<aside>
    <textarea cols=80 id="ocorrencia-policial-descricao" rows="10" name="opiniao" maxlength="500" wrap="hard"></textarea>
</aside>


</body>
</html>
