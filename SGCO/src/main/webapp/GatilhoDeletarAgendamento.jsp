<%@page import="dao.AgendamentosCirurgiasDao, tabelas.TbAgendamentosCirurgias"%>
<jsp:useBean id="ca" class="tabelas.TbAgendamentosCirurgias"></jsp:useBean>
<jsp:setProperty property="*" name="ca"/>



<%
String id = request.getParameter("id");
if (id != null) {
    int idAgendamento = Integer.parseInt(id);
    TbAgendamentosCirurgias agendamentosCirurgias = AgendamentosCirurgiasDao.getRegistroById(idAgendamento);
    int i = AgendamentosCirurgiasDao.deletarAgendamento(agendamentosCirurgias);
    response.sendRedirect("ConsultarAgendamento.jsp");
    
}
%>



