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


</head>
<body>

<div id="nav">
    <ul>
        <li width='65' class="home"><a href='tela_escolher_ocorrencia' title='Página Incial'><img src='\css\imagens\home.png' width="40"/></a></li>


        <li width='65' class="sair"><a href='deslogar' title='Sair'><img src='\css\imagens\sair.png' width="39"/></a></li>



    </ul>
</div>


<a href="tela_usuario_login.jsp" class="botao_sair">Sair</a>

<div class="pai">

<h3 align="center" >Bem Vindo,  <%=emissor.getNome()%>! <a href="tela_usuario_login.jsp"></a></h3>
</div>
<div class=" filho">
    <%int codigo = emissor.getId();%>
<a  href="tela_usuario_alterar.jsp?id=<%=codigo%>" class="link_alterar">Alterar</a>
    </div>
<div id="caixa-escolher">

    <div id="caixa-escolher-interna">

        <div id="caixa-escolher-label">Escolha a Ocorrência</div>

        <div id="botoes">
            <a href="tela_emitir_ocorrencia_policial.jsp" title="
Chamar a viatura policial em caso de crimes"><button id="ocorrencia-policial">Ocorrência Policial</button></a>

            <a href="tela_emitir_ocorrencia_medica.jsp" title="Chamar o SAMU em caso de urgência e saúde em estado crítico"><button id="ocorrencia-medica">Ocorrência Médica</button></a>

            <a href="tela_emitir_ocorrencia_corpo_de_bombeiros.jsp" title="Chamar a ambulancia dos bombeiros em caso de necessidade de primeiros socorros"><button id="ocorrencia-bombeiros">Corpo de Bombeiros</button></a>

            <a href="tela_emitir_ocorrencia_defesa_civil.jsp" title="Chamar o carro da defesa civil em casos de desastres naturais"><button id="ocorrencia-defesa-civil">Defesa Cívil</button></a>
        </div>

    </div>
</div>


</body>
</html>
