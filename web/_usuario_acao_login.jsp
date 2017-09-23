<%@page import="dao.EmissorDAO" %>
<%@ page import="dao.ReceptorDAO" %>
<%@ page import="model.Receptor" %>
<%@ page import="model.Emissor" %>


<%

    String email = request.getParameter("usuario-email");
    String senha = request.getParameter("usuario-senha");
    Emissor emissor = EmissorDAO.realizarLogin(email, senha);
    Receptor receptor = ReceptorDAO.realizarLogin(email, senha);
    if (emissor != null) {
        session.setAttribute("emissor", emissor);
        response.sendRedirect("tela_usuario_escolher_ocorrencia.jsp");
    } else if (receptor != null) {
        session.setAttribute("receptor", receptor);

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

    } else {
        session.removeAttribute("receptor");
        session.removeAttribute("emissor");
        response.sendRedirect("tela_usuario_login.jsp");
    }

%>