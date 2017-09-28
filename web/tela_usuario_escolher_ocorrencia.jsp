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
<jsp:include page="menu_superior_escolher_ocorrencia.jsp" />
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
O 190 é destinado ao atendimento da população nas situações de urgências policiais, por isso ao utilizá-lo, seja breve, pois outra pessoa pode estar em risco real e precisando da PM o mais rápido possível."><button id="ocorrencia-policial">Ocorrência Policial</button></a>

            <a href="tela_emitir_ocorrencia_medica.jsp" title="O Serviço de Atendimento Móvel de Urgência realiza o atendimento de urgência e emergência, por intermédio de ambulâncias, em qualquer lugar: residências, locais de trabalho e vias públicas."><button id="ocorrencia-medica">Ocorrência Médica</button></a>

            <a href="tela_emitir_ocorrencia_corpo_de_bombeiros.jsp" title="Tem a missão de proteção de vidas, patrimônio e meio ambiente e busca ser referência para a sociedade pela excelência dos serviços prestados, por meio da qualificação dos seus integrantes, da gestão estratégica da Instituição, do constante reequipamento e da inovação tecnológica."><button id="ocorrencia-bombeiros">Corpo de Bombeiros</button></a>

            <a href="tela_emitir_ocorrencia_defesa_civil.jsp" title="DEFESA CIVIL (SIADE) é um serviço telefônico especial, não tarifado, destinado à comunicação de emergência com a Defesa Civil, de âmbito local, para atender a comunidade do Distrito Federal. "><button id="ocorrencia-defesa-civil">Defesa Cívil</button></a>
        </div>

    </div>
</div>


</body>
</html>
