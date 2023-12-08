package dao;

import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;
import tabelas.TbMedico;

public class MedicoDao {
	private static String selectString = "select * from medico";

	public static Connection getConnection() {

		Connection conexao = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/tcc", "root", "1802");
		} catch (Exception e) {
			System.out.println(e);
		}
		return conexao;
	}
	
	public static List<TbMedico> getAllMedico(){
		List <TbMedico> lista = new ArrayList<TbMedico>();
		
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao.prepareStatement(selectString);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				
				TbMedico medico = new TbMedico();
				medico.setIdMedico(rs.getInt("id_medico"));
				medico.setNomeMedico(rs.getString("nome"));
				medico.setDataNascimento(rs.getDate("data_nascimento"));
				medico.setRg(rs.getString("RG"));
				medico.setCpf(rs.getString("CPF"));
				medico.setUrCrm(rs.getString("ur_crm"));
				medico.setNumeroCrm(rs.getString("numero_crm"));
				medico.setCelular(rs.getString("celular"));
				medico.setEmail(rs.getString("email"));
				medico.setSexo(rs.getString("sexo"));
				lista.add(medico);
			}
			
		} catch (Exception e) {
			System.out.println("ERRO NO BANCO " + e);
		}
		return lista;
	}
	
	public static TbMedico getRegistroById(int idMedico) {
		TbMedico medico = null;

		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("select * from medico where id_medico=?");
			pst.setInt(1, idMedico);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				medico = new TbMedico();
				medico.setIdMedico(rs.getInt("id_medico"));
				medico.setNomeMedico(rs.getString("nome"));
				medico.setDataNascimento(rs.getDate("data_nascimento"));
				medico.setRg(rs.getString("RG"));
				medico.setCpf(rs.getString("CPF"));
				medico.setUrCrm(rs.getString("ur_crm"));
				medico.setNumeroCrm(rs.getString("numero_crm"));
				medico.setCelular(rs.getString("celular"));
				medico.setEmail(rs.getString("email"));
				medico.setSexo(rs.getString("sexo"));
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return medico;
	}
	
	public static int deletarMedico(TbMedico idMedico, HttpServletRequest request ) {
		int status = 0;
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("DELETE FROM medico WHERE id_medico=?");
			pst.setInt(1, idMedico.getIdMedico());
			status = pst.executeUpdate();
		} catch (SQLException e) {
			HttpSession session = request.getSession();

			if (e.getErrorCode() == 1451) {

				session.setAttribute("erroInsercao",
						"NÃO FOI POSSIVEL EXLUIR HOSPITAL! AGENDAMENTO EM ANDAMENTO ");
			}
		}
		return status;
	}
	public static int insertMedico(TbMedico m, HttpServletRequest request) {
		int status = 0;
		HttpSession session = request.getSession();

		String sqlString = ("insert into medico (nome, data_nascimento, RG, CPF, ur_crm, numero_crm, celular, email, sexo) values (?, ?, ?, ?, ?, ?, ?, ?, ?)");
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao.prepareStatement(sqlString);
			pst.setString(1, m.getNomeMedico());
			pst.setString(2, m.getDataNascimentoStg());
			pst.setString(3, m.getRg());
			pst.setString(4, m.getCpf());
			pst.setString(5, m.getUrCrm());
			pst.setString(6, m.getNumeroCrm());
			pst.setString(7, m.getCelular());
			pst.setString(8, m.getEmail());
			pst.setString(9, m.getSexo());
			status = pst.executeUpdate();
			
			session = request.getSession();
	        session.setAttribute("msgBanco", "MÉDICO CADASTRADO COM SUCESSO!!");
			
		} catch (SQLException e) {

			if (e.getErrorCode() == 1062) {

				session.setAttribute("erroInsercao",
						"DADOS DUPLICADO! VERIFIQUE E TENTE NOVAMENTE ");
			}		}
		return status;
	}
	
	public static int updateMedico(TbMedico m) {
		int status = 0;

		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao.prepareStatement(
					"UPDATE medico SET nome=?, data_nascimento=?, RG=?, CPF=?, ur_crm=?, numero_crm=?, celular=?, email=?, sexo=? WHERE id_medico=?");
			pst.setString(1, m.getNomeMedico());
			pst.setString(2, m.getDataNascimentoStg());
			pst.setString(3, m.getRg());
			pst.setString(4, m.getCpf());
			pst.setString(5, m.getUrCrm());
			pst.setString(6, m.getNumeroCrm());
			pst.setString(7, m.getCelular());
			pst.setString(8, m.getEmail());
			pst.setString(9, m.getSexo());
			pst.setInt(10, m.getIdMedico());
			status = pst.executeUpdate();

		} catch (Exception e) {
			System.out.println("ERRO NO BANCO " + e);
		}
		return status;
	}

public static List<TbMedico> getRegistroByNome(String nomeMedico) {
	List<TbMedico> lista = new ArrayList<TbMedico>();
	String sqllike = "%" + nomeMedico + "%";
	try {
		Connection conexao = getConnection();
		PreparedStatement pst = (PreparedStatement) conexao
				.prepareStatement("select * from medico where nome like ?");
		pst.setString(1, sqllike);
		ResultSet rs = pst.executeQuery();

		while (rs.next()) {
			TbMedico medico = new TbMedico();
			medico.setIdMedico(rs.getInt("id_medico"));
			medico.setNomeMedico(rs.getString("nome"));
			medico.setDataNascimento(rs.getDate("data_nascimento"));
			medico.setRg(rs.getString("RG"));
			medico.setCpf(rs.getString("CPF"));
			medico.setUrCrm(rs.getString("ur_crm"));
			medico.setNumeroCrm(rs.getString("numero_crm"));
			medico.setCelular(rs.getString("celular"));
			medico.setEmail(rs.getString("email"));
			medico.setSexo(rs.getString("sexo"));
			lista.add(medico);
		}

	} catch (Exception e) {
		System.out.println(e);
	}
	return lista;
}
public static List<TbMedico> getRegistroByRg(String rg) {
	List<TbMedico> lista = new ArrayList<TbMedico>();
	String sqllike = rg + "%";
	try {
		Connection conexao = getConnection();
		PreparedStatement pst = (PreparedStatement) conexao
				.prepareStatement("select * from medico where RG like ?");
		pst.setString(1, sqllike);
		ResultSet rs = pst.executeQuery();

		while (rs.next()) {
			TbMedico medico = new TbMedico();
			medico.setIdMedico(rs.getInt("id_medico"));
			medico.setNomeMedico(rs.getString("nome"));
			medico.setDataNascimento(rs.getDate("data_nascimento"));
			medico.setRg(rs.getString("RG"));
			medico.setCpf(rs.getString("CPF"));
			medico.setUrCrm(rs.getString("ur_crm"));
			medico.setNumeroCrm(rs.getString("numero_crm"));
			medico.setCelular(rs.getString("celular"));
			medico.setEmail(rs.getString("email"));
			medico.setSexo(rs.getString("sexo"));
			lista.add(medico);
		}

	} catch (Exception e) {
		System.out.println(e);
	}
	return lista;
}
public static List<TbMedico> getRegistroByCpf(String cpf) {
	List<TbMedico> lista = new ArrayList<TbMedico>();
	String sqllike = cpf + "%";
	try {
		Connection conexao = getConnection();
		PreparedStatement pst = (PreparedStatement) conexao
				.prepareStatement("select * from medico where CPF like ?");
		pst.setString(1, sqllike);
		ResultSet rs = pst.executeQuery();

		while (rs.next()) {
			TbMedico medico = new TbMedico();
			medico.setIdMedico(rs.getInt("id_medico"));
			medico.setNomeMedico(rs.getString("nome"));
			medico.setDataNascimento(rs.getDate("data_nascimento"));
			medico.setRg(rs.getString("RG"));
			medico.setCpf(rs.getString("CPF"));
			medico.setUrCrm(rs.getString("ur_crm"));
			medico.setNumeroCrm(rs.getString("numero_crm"));
			medico.setCelular(rs.getString("celular"));
			medico.setEmail(rs.getString("email"));
			medico.setSexo(rs.getString("sexo"));
			lista.add(medico);
		}

	} catch (Exception e) {
		System.out.println(e);
	}
	return lista;
}
public static List<TbMedico> getRegistroByCrm(String crm) {
	List<TbMedico> lista = new ArrayList<TbMedico>();
	String sqllike =crm + "%";
	try {
		Connection conexao = getConnection();
		PreparedStatement pst = (PreparedStatement) conexao
				.prepareStatement("select * from medico where numero_crm like ?");
		pst.setString(1, sqllike);
		ResultSet rs = pst.executeQuery();

		while (rs.next()) {
			TbMedico medico = new TbMedico();
			medico.setIdMedico(rs.getInt("id_medico"));
			medico.setNomeMedico(rs.getString("nome"));
			medico.setDataNascimento(rs.getDate("data_nascimento"));
			medico.setRg(rs.getString("RG"));
			medico.setCpf(rs.getString("CPF"));
			medico.setUrCrm(rs.getString("ur_crm"));
			medico.setNumeroCrm(rs.getString("numero_crm"));
			medico.setCelular(rs.getString("celular"));
			medico.setEmail(rs.getString("email"));
			medico.setSexo(rs.getString("sexo"));
			lista.add(medico);
		}

	} catch (Exception e) {
		System.out.println(e);
	}
	return lista;
}
}