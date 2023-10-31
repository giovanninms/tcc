<%@page import="dao.AgendamentosCirurgiasDao"%>
<jsp:useBean id="a" class="tabelas.AgendamentosCirurgias"></jsp:useBean>
<jsp:setProperty property="*" name="a" />
<%
	 AgendamentosCirurgiasDao.deleteAgendamento(a);
	response.sendRedirect("home.jsp");
%>

