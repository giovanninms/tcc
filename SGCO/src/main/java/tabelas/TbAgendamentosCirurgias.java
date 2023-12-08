package tabelas;

import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;

public class TbAgendamentosCirurgias {
	private int idAgendamento;
	private String localCorpo;
	private String tipoCirurgia;
	private String statusAgendamento;
	private String dataHoraString;
	private Timestamp dataHoraViwer;
	private String stgFkPaciente;
	private String stgFkMedico;
	private String stgFkHospital;


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


	public String getDataHoraString() {
		return dataHoraString;
	}

	public void setDataHoraString(String dataHoraString) {
		this.dataHoraString = dataHoraString;		
	}

	public Timestamp getDataHoraViwer() {
		return dataHoraViwer;
	}

	public void setDataHoraViwer(Timestamp dataHoraViwer) {
		this.dataHoraViwer = dataHoraViwer;
	}
	public String getDataHoraViwerFormatted() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy, HH:mm");
        return dataHoraViwer.toLocalDateTime().format(formatter);
    }	


	public String getStgFkPaciente() {
		return stgFkPaciente;
	}

	public void setStgFkPaciente(String stgFkPaciente) {
		this.stgFkPaciente = stgFkPaciente;
	}

	public String getStgFkMedico() {
		return stgFkMedico;
	}

	public void setStgFkMedico(String stgFkMedico) {
		this.stgFkMedico = stgFkMedico;
	}

	public String getStgFkHospital() {
		return stgFkHospital;
	}

	public void setStgFkHospital(String stgFkHospital) {
		this.stgFkHospital = stgFkHospital;
	}


}
