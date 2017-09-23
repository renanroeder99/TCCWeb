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
</head>
<body>
<h1 align="center">Bem Vindo! <%=emissor.getUsuario()%>!</h1>
    <div class="caixa-escolher">

        <div id="caixa-escolher-interna">
            <div class="input-div">
                <button type="button"> id="ocorrencia-policial"
                <a href="tela_emitir_ocorrencia_policial.jsp"/>
                </button>
             </div>

            <div class="input-div">

                <button  type="button" id="ocorrencia-medica"
                   href="tela_emitir_ocorrencia_medica.jsp"/>
            </button>
            </div>

            <div class="input-div">

                <button type="button" id="ocorrencia-corpo-bombeiro"
                        href="tela_emitir_ocorrencia_corpo_de_bombeiros.jsp"/>
            </button>
            </div>

            <div class="input-div">
                <button type="button" id="ocorrencia-defesa-civil"
                        href="tela_emitir_ocorrencia_defesa_civil.jsp"/>
            </button>
            </div>



        </div>
    </div>
            <div class="input-div">
                <textarea cols=80 id="ocorrencia-policial-descricao" rows="10" name="opiniao" maxlength="500" wrap="hard"></textarea>
            </div>


</body>
</html>
