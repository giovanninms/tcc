package tabelas;

public class TbComponentes {

	private static int IdComponente;
	private static String nomeComponente;
	private static int codigoComponente;
	private static int quantidadeComponentes;
	private static String cirugiaUtilizada;
	
	public TbComponentes() {
		
	}

	public static int getIdComponente() {
		return IdComponente;
	}

	public static void setIdComponente(int idComponente) {
		IdComponente = idComponente;
	}

	public static String getNomeComponente() {
		return nomeComponente;
	}

	public static void setNomeComponente(String nomeComponente) {
		TbComponentes.nomeComponente = nomeComponente;
	}

	public static int getCodigoComponente() {
		return codigoComponente;
	}

	public static void setCodigoComponente(int codigoComponente) {
		TbComponentes.codigoComponente = codigoComponente;
	}

	public static int getQuantidadeComponentes() {
		return quantidadeComponentes;
	}

	public static void setQuantidadeComponentes(int quantidadeComponentes) {
		TbComponentes.quantidadeComponentes = quantidadeComponentes;
	}

	public static String getCirugiaUtilizada() {
		return cirugiaUtilizada;
	}

	public static void setCirugiaUtilizada(String cirugiaUtilizada) {
		TbComponentes.cirugiaUtilizada = cirugiaUtilizada;
	}

	
	
}
