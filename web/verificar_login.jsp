<%@ page import="model.Receptor" %><%
    if(session.getAttribute("emissor") != null){
        response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
        return;
    }
    if(session.getAttribute("receptor") != null){
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
    response.sendRedirect("tela_usuario_login.jsp");
%>