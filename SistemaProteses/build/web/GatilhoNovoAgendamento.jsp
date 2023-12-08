<%@page import="DAO.AgendamentosCirurgiasDao"%>
<jsp:useBean id="a" class="Tabelas.AgendamentosCirurgias"></jsp:useBean>
<jsp:setProperty property="*" name="a"/>


<%
int i = AgendamentosCirurgiasDao.insertAgendamento(a);
	response.sendRedirect("AgendamentosCirurgias.jsp");
%>