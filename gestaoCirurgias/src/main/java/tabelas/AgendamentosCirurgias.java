package tabelas;

import java.sql.Date;
import java.sql.Time;
//import java.util.Date;

public class AgendamentosCirurgias {
	private int idAgendamento;
	private String localCorpo;
	private String tipoCirurgia;
	private String statusAgendamento;
	private int fkPaciente;
	private int fkMedico;
	private Date data;
	private Time hora;
	public AgendamentosCirurgias() {
		
	}
	public int getIdAgendamento() {
		return idAgendamento;
	}
	public void setIdAgendamento(int idAgendamento) {
		this.idAgendamento = idAgendamento;
	}
	public String getLocalCorpo() {
		return localCorpo;
	}
	public void setLocalCorpo(String localCorpo) {
		this.localCorpo = localCorpo;
	}
	public String getTipoCirurgia() {
		return tipoCirurgia;
	}
	public void setTipoCirurgia(String tipoCirurgia) {
		this.tipoCirurgia = tipoCirurgia;
	}
	public String getStatusAgendamento() {
		return statusAgendamento;
	}
	public void setStatusAgendamento(String statusAgendamento) {
		this.statusAgendamento = statusAgendamento;
	}
	public int getFkPaciente() {
		return fkPaciente;
	}
	public void setFkPaciente(int fkPaciente) {
		this.fkPaciente = fkPaciente;
	}
	public int getFkMedico() {
		return fkMedico;
	}
	public void setFkMedico(int fkMedico) {
		this.fkMedico = fkMedico;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public Time getHora() {
		return hora;
	}
	public void setHora(Time hora) {
		this.hora = hora;
	}
	
}
