package tabelas;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class TbMedico {
	
	private int idMedico;
	private String nomeMedico;
	private Date dataNascimento;
	private String dataNascimentoStg;
	private String rg;
	private String cpf;
	private String urCrm;
	private String numeroCrm;
	private String celular;
	private String email;
	private String sexo;
	
	public int getIdMedico() {
		return idMedico;
	}
	public void setIdMedico(int idMedico) {
		this.idMedico = idMedico;
	}
	public String getNomeMedico() {
		return nomeMedico;
	}
	public void setNomeMedico(String nomeMedico) {
		this.nomeMedico = nomeMedico;
	}
	public Date getDataNascimento() {
		return dataNascimento;
	}
	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
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
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getUrCrm() {
		return urCrm;
	}
	public void setUrCrm(String urCrm) {
		this.urCrm = urCrm;
	}
	public String getNumeroCrm() {
		return numeroCrm;
	}
	public void setNumeroCrm(String numeroCrm) {
		this.numeroCrm = numeroCrm;
	}
	public String getCelular() {
		return celular;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	
	
	
}
