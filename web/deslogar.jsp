<%
    if(session.getAttribute("email") != null){
        session.removeAttribute("email");
        response.sendRedirect("aluno_login.jsp");
    }
%>