
<%@page import="dao.EmissorDAO" %>
<%@ page import="dao.ReceptorDAO" %>
<%@ page import="model.Receptor" %><%

String email = request.getParameter("usuario-email");
String senha = request.getParameter("usuario-senha");
boolean logadoEmissor = EmissorDAO.realizarLogin(email, senha);
boolean logadoReceptor = ReceptorDAO.realizarLogin(email, senha);
Receptor receptor = new Receptor();
if(logadoEmissor){
    session.setAttribute("email", email);
    response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
}else if(logadoReceptor) {
    session.setAttribute("email", email);

    if (receptor.getCargo().equals("MED")) {
        response.sendRedirect("tela_receptor_medico.jsp");
    } else if (receptor.getCargo().equals("DFC")) {
        response.sendRedirect("tela_receptor_defesa_civil.jsp");
    } else if (receptor.getCargo().equals("CDB")) {
        response.sendRedirect("tela_receptor_medico.jsp");
    } else if (receptor.getCargo().equals("POL")) {
        response.sendRedirect("tela_receptor_policial.jsp");
    }
}else{
    session.removeAttribute("email");
    response.sendRedirect("tela_usuario_login.jsp");
}

%>