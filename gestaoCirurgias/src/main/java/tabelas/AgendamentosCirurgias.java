package tabelas;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class AgendamentosCirurgias {
	private int idAgendamento;
	private String localCorpo;
	private String tipoCirurgia;
	private String statusAgendamento;
	private int fkPaciente;
	private int fkMedico;
	private LocalDateTime dataHora;
	private String dataHoraString;
	private Timestamp dataHoraViwer;

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

	public LocalDateTime getDataHora() {
		return dataHora;
	}

	public void setDataHora(LocalDateTime dataHora) {
		this.dataHora = dataHora;
		//this.dataHoraString = dataHora.format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"));
	}

	public String getDataHoraString() {
		return dataHoraString;
	}

	public void setDataHoraString(String dataHoraString) {
		this.dataHoraString = dataHoraString;
		// O PropertyEditor fará a conversão de dataHoraString para LocalDateTime
		//this.dataHoraString = dataHora.format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"));
		
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

}
