<%@page import="dao.AgendamentosCirurgiasDao, tabelas.AgendamentosCirurgias"%>
<jsp:useBean id="ca" class="tabelas.AgendamentosCirurgias"></jsp:useBean>
<jsp:setProperty property="*" name="ca"/>



<%
String id = request.getParameter("id");
if (id != null) {
    int idAgendamento = Integer.parseInt(id);
    AgendamentosCirurgias agendamentosCirurgias = AgendamentosCirurgiasDao.getRegistroById(idAgendamento);
    int i = AgendamentosCirurgiasDao.deletarAgendamento(agendamentosCirurgias);
    response.sendRedirect("index.jsp");
    // Coloque aqui o código para realizar o cancelamento com base no ID do agendamento.
    // Você já tem o código para excluir o agendamento em "AgendamentosCirurgiasDao.deletarAgendamento" na classe Java.
}
%>



