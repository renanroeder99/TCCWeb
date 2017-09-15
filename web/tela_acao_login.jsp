
<%@page import="dao.EmissorDAO" %>
<%@ page import="dao.ReceptorDAO" %><%

String email = request.getParameter("usuario-email");
String senha = request.getParameter("usuario-senha");
boolean logadoEmissor = EmissorDAO.realizarLogin(email, senha);
boolean logadoReceptor = ReceptorDAO.realizarLogin(email, senha);
if(logadoEmissor){
    session.setAttribute("email", email);
    response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
}else{
    session.removeAttribute("email");
    response.sendRedirect("tela_usuario_login.jsp");
}
%>