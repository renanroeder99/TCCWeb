<%@ page import="dao.OcorrenciaPolicialDAO" %>
<%@ page import="model.BaseOcorrencia" %><% try{
    int id = Integer.parseInt(request.getParameter("id"));

    if(id > 0) {
        OcorrenciaPolicialDAO.excluirPolicial(id);
        BaseOcorrencia ocorrencia = OcorrenciaPolicialDAO.buscarOcorrenciaPolicialPorID(id);
        if (ocorrencia == null) {
            response.sendRedirect("tela_receptor_policial.jsp?message=ok");
        } else {
            response.sendRedirect("tela_receptor_policial.jsp?message=errou");
        }
    }
}catch (NumberFormatException e){

}
%>