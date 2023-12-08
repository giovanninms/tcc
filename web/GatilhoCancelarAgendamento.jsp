<%@page import="DAO.AgendamentosCirurgiasDao"%>
<jsp:useBean id="a" class="Tabelas.AgendamentosCirurgias"></jsp:useBean>
<jsp:setProperty property="*" name="a" />
<%
	 AgendamentosCirurgiasDao.deleteAgendamento(a);
	response.sendRedirect("AgendamentosCirurgias.jsp");
%>
