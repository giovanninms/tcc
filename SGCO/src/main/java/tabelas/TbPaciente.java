package tabelas;

import java.sql.Date;
import java.text.SimpleDateFormat;


public class TbPaciente {

	private int idPaciente;
	private String nomePaciente;
	private Date dataNascimento;
	private String dataNascimentoStg;
	private String rgPaciente;
	private String cpfPaciente;
	private String celular;
	private int alturaCm;
	private float pesoKg;
	private String sexo;
	private String email;
	public int getIdPaciente() {
		return idPaciente;
	}
	public void setIdPaciente(int idPaciente) {
		this.idPaciente = idPaciente;
	}
	public String getNomePaciente() {
		return nomePaciente;
	}
	public void setNomePaciente(String nomePaciente) {
		this.nomePaciente = nomePaciente;
	}
	public Date getDataNascimento() {
		return dataNascimento;
	}
	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}
	public String getRgPaciente() {
		return rgPaciente;
	}
	public void setRgPaciente(String rgPaciente) {
		this.rgPaciente = rgPaciente;
	}
	public String getCpfPaciente() {
		return cpfPaciente;
	}
	public void setCpfPaciente(String cpfPaciente) {
		this.cpfPaciente = cpfPaciente;
	}
	public String getCelular() {
		return celular;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}
	public int getAlturaCm() {
		return alturaCm;
	}
	public void setAlturaCm(int alturaCm) {
		this.alturaCm = alturaCm;
	}
	public float getPesoKg() {
		return pesoKg;
	}
	public void setPesoKg(float pesoKg) {
		this.pesoKg = pesoKg;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDataNascimentoViwerFormatted() {
        SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
        return formatter.format(dataNascimento);
    }
	public String getDataNascimentoStg() {
		return dataNascimentoStg;
	}
	public void setDataNascimentoStg(String dataNascimentoStg) {
		this.dataNascimentoStg = dataNascimentoStg;
	}
	
	
}
