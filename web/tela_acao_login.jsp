
<%@page import="dao.EmissorDAO" %><%

String email = request.getParameter("usuario-email");
String senha = request.getParameter("usuario-senha");
boolean logado = EmissorDAO.realizarLogin(email, senha);
if(logado){
    session.setAttribute("email", email);
    response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
}else{
    session.removeAttribute("email");
    response.sendRedirect("tela_usuario_login.jsp");
}
%>