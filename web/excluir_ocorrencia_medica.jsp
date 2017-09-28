<%@ page import="dao.OcorrenciaMedicaDAO" %>
<%@ page import="model.BaseOcorrencia" %><% try{
    int id = Integer.parseInt(request.getParameter("id"));

    if(id > 0) {
        OcorrenciaMedicaDAO.excluirMedico(id);
        BaseOcorrencia ocorrencia = OcorrenciaMedicaDAO.buscarOcorrenciaMedicaPorID(id);
        if (ocorrencia == null) {
            response.sendRedirect("tela_receptor_medico.jsp?message=ok");
        } else {
            response.sendRedirect("tela_receptor_medico.jsp?message=errou");
        }
    }
}catch (NumberFormatException e){

}
%>