<%
    if(session.getAttribute("emissor") != null){
        session.removeAttribute("emissor");
        response.sendRedirect("tela_usuario_login.jsp");
    }

    if(session.getAttribute("receptor") != null){
        session.removeAttribute("receptor");
        response.sendRedirect("tela_usuario_login.jsp");
    }


%>
