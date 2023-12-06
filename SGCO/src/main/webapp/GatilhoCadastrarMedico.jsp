<%@page import="dao.MedicoDao"%>
<jsp:useBean id="m" class="tabelas.TbMedico" ></jsp:useBean>
<jsp:setProperty property="*" name="m"/>

<%
	int i = MedicoDao.insertMedico(m, request);
if(i==1){
    response.sendRedirect("ConsultarMedico.jsp");

}else{
    response.sendRedirect("CadastrarMedico.jsp");

}%>