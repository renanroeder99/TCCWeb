<%@ page import="dao.OcorrenciaCorpoDeBombeirosDAO" %>
<%@ page import="model.BaseOcorrencia" %>
<%  try{
    int id = Integer.parseInt(request.getParameter("id"));
    if(id > 0){
        OcorrenciaCorpoDeBombeirosDAO.excluirCorpoDeBombeiros(id);
        BaseOcorrencia ocorrencia = OcorrenciaCorpoDeBombeirosDAO.buscarOcorrenciaBombeiroPorId(id);
        if(ocorrencia == null){
            response.sendRedirect("tela_receptor_bombeiro.jsp?message=ok");
        }else{
            response.sendRedirect("tela_receptor_bombeiro.jsp?message=errou");
        }
    }
}catch (NumberFormatException e){

}
%>