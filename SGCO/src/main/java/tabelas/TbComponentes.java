package tabelas;

public class TbComponentes {

	private  int idComponente;
	private  String nomeComponente;
	private  int codigoComponente;
	private  int quantidadeComponentes;
	private  String cirurgiaUtilizada;
	private String localCorpo;
	
	public String getLocalCorpo() {
		return localCorpo;
	}

	public void setLocalCorpo(String localCorpo) {
		this.localCorpo = localCorpo;
	}

	public TbComponentes() {
		
	}

	public int getIdComponente() {
		return idComponente;
	}

	public void setIdComponente(int idComponente) {
		this.idComponente = idComponente;
	}

	public String getNomeComponente() {
		return nomeComponente;
	}

	public void setNomeComponente(String nomeComponente) {
		this.nomeComponente = nomeComponente;
	}

	public int getCodigoComponente() {
		return codigoComponente;
	}

	public void setCodigoComponente(int codigoComponente) {
		this.codigoComponente = codigoComponente;
	}

	public int getQuantidadeComponentes() {
		return quantidadeComponentes;
	}

	public void setQuantidadeComponentes(int quantidadeComponentes) {
		this.quantidadeComponentes = quantidadeComponentes;
	}

	public String getCirurgiaUtilizada() {
		return cirurgiaUtilizada;
	}

	public void setCirurgiaUtilizada(String cirurgiaUtilizada) {
		this.cirurgiaUtilizada = cirurgiaUtilizada;
	}
	
}
