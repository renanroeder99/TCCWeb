
<%@page import="dao.EmissorDAO" %>
<%@ page import="dao.ReceptorDAO" %>
<%@ page import="model.Receptor" %>
<%@ page import="model.Emissor" %><%

String email = request.getParameter("usuario-username");
String senha = request.getParameter("usuario-senha");
Emissor emissor = EmissorDAO.realizarLogin(email, senha);
boolean logadoReceptor = ReceptorDAO.realizarLogin(email, senha);
Receptor receptor = new Receptor();
if(emissor != null){
    session.setAttribute("emissor", emissor);
    response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
}else if(logadoReceptor) {
    session.setAttribute("email", email);
    switch (receptor.getCargo()) {
        case "MED":
            response.sendRedirect("tela_receptor_medico.jsp");
            break;
        case "DFC":
            response.sendRedirect("tela_receptor_defesa_civil.jsp");
            break;
        case "CDB":
            response.sendRedirect("tela_receptor_medico.jsp");
            break;
        case "POL":
            response.sendRedirect("tela_receptor_policial.jsp");
            break;
    }

}else{
    session.removeAttribute("email");
    response.sendRedirect("tela_usuario_login.jsp");
}

%>