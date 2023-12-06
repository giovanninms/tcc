<%@page import="dao.ComponentesDao"%>
<jsp:useBean id="c" class="tabelas.TbComponentes"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>


<%

int i = ComponentesDao.insertComponente(c, request);
if(i==1){
		response.sendRedirect("ConsultarComponentes.jsp");

	}else{
		response.sendRedirect("CadastrarComponente.jsp");
	}
	%>