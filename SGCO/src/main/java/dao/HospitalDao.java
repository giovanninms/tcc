package dao;

import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import tabelas.*;

public class HospitalDao {
	public static Connection getConnection() {
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tcc", "root", "1802");
			System.out.println("Conexão com o banco realizada com sucesso");
		} catch (Exception e) {
			System.out.println("Não conectou no banco de dados. Erro: " + e);
		}
		return con;
	}

	public static TbHospital getRegistroById(int id) {

		TbHospital objhospital = null;

		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("SELECT * FROM hospital WHERE id_hospital=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				objhospital = new TbHospital();
				objhospital.setIdHospital(rs.getInt("id_hospital"));
				objhospital.setRazaoSocial(rs.getString("razao_social"));
				objhospital.setNomeFantasia(rs.getString("nome_fantasia"));
				objhospital.setCnpjHospital(rs.getString("cnpj"));
				objhospital.setRua(rs.getString("rua"));
				objhospital.setBairro(rs.getString("bairro"));
				objhospital.setCidade(rs.getString("cidade"));
				objhospital.setEstado(rs.getString("estado"));
				objhospital.setTelefone(rs.getString("telefone"));
				objhospital.setEmail(rs.getString("email"));

			}

		} catch (Exception e) {
			System.out.println("Erro a consultar o hospital. Erro: " + e);
		}
		System.out.println(objhospital.getIdHospital());
		return objhospital;
	}

	public static int AtualizarHospital(TbHospital h) {
		int status = 0;
		try {

			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"UPDATE hospital SET razao_social=?, nome_fantasia=?, cnpj=? WHERE id_hospital=?");
			ps.setString(1, h.getRazaoSocial());
			ps.setString(2, h.getNomeFantasia());
			ps.setString(3, h.getCnpjHospital());
			ps.setInt(4, h.getIdHospital());

			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Erro ao atualizar hospital. Erro: " + e);
		}
		return status;
	}

	public static int CadastrarHospital(TbHospital h, HttpServletRequest request) {
		int status = 0;
		HttpSession session = request.getSession();

		try {

			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"INSERT INTO hospital (razao_social, nome_fantasia, cnpj, rua, bairro, cidade, estado, telefone, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, h.getRazaoSocial());
			ps.setString(2, h.getNomeFantasia());
			ps.setString(3, h.getCnpjHospital());
			ps.setString(4, h.getRua());
			ps.setString(5, h.getBairro());
			ps.setString(6, h.getCidade());
			ps.setString(7, h.getEstado());
			ps.setString(8, h.getTelefone());
			ps.setString(9, h.getEmail());
			
			status = ps.executeUpdate();
			session = request.getSession();
	        session.setAttribute("msgBanco", "HOSPITAL CADASTRADO COM SUCESSO!!");
		} catch (SQLException e) {

			if (e.getErrorCode() == 1062) {

				session.setAttribute("erroInsercao",
						"DADOS DUPLICADO! VERIFIQUE E TENTE NOVAMENTE ");
			}

		}

		return status;
	}

	public static int DeletarHospital(TbHospital h, HttpServletRequest request) {
		int status = 0;
		try {

			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("DELETE FROM hospital WHERE id_hospital=?");
			ps.setInt(1, h.getIdHospital());

			status = ps.executeUpdate();
		} catch (SQLException e) {
			HttpSession session = request.getSession();

			if (e.getErrorCode() == 1451) {

				session.setAttribute("erroInsercao",
						"NÃO FOI POSSIVEL EXLUIR HOSPITAL! AGENDAMENTO EM ANDAMENTO ");
			}
		}
		return status;
	}

	public static List<TbHospital> getAllHospital() {
		List<TbHospital> lista = new ArrayList<TbHospital>();

		try {
			Connection con = getConnection();

			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM hospital");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				TbHospital objhospital = new TbHospital();
				objhospital.setIdHospital(rs.getInt("id_hospital"));
				objhospital.setRazaoSocial(rs.getString("razao_social"));
				objhospital.setNomeFantasia(rs.getString("nome_fantasia"));
				objhospital.setCnpjHospital(rs.getString("cnpj"));
				objhospital.setRua(rs.getString("rua"));
				objhospital.setBairro(rs.getString("bairro"));
				objhospital.setCidade(rs.getString("cidade"));
				objhospital.setEstado(rs.getString("estado"));
				objhospital.setTelefone(rs.getString("telefone"));
				objhospital.setEmail(rs.getString("email"));

				lista.add(objhospital);
			}
		} catch (Exception e) {
			
			System.out.println("Erro ao conectar com o banco. Erro: " + e);
		}
		return lista;

	}

	public static List<TbHospital> getRegistroByRazaoSocial(String razaoSocial) {
		List<TbHospital> lista = new ArrayList<TbHospital>();
		String sqllike = "%" + razaoSocial + "%";
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("select * from hospital where razao_social like ?");
			pst.setString(1, sqllike);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				TbHospital objhospital = new TbHospital();
				objhospital.setIdHospital(rs.getInt("id_hospital"));
				objhospital.setRazaoSocial(rs.getString("razao_social"));
				objhospital.setNomeFantasia(rs.getString("nome_fantasia"));
				objhospital.setCnpjHospital(rs.getString("cnpj"));
				objhospital.setRua(rs.getString("rua"));
				objhospital.setBairro(rs.getString("bairro"));
				objhospital.setCidade(rs.getString("cidade"));
				objhospital.setEstado(rs.getString("estado"));
				objhospital.setTelefone(rs.getString("telefone"));
				objhospital.setEmail(rs.getString("email"));
				lista.add(objhospital);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}

	public static List<TbHospital> getRegistroByNomeFantasia(String nomeFantasia) {
		List<TbHospital> lista = new ArrayList<TbHospital>();
		String sqllike = "%" + nomeFantasia + "%";
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("select * from hospital where nome_fantasia like ?");
			pst.setString(1, sqllike);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				TbHospital objhospital = new TbHospital();
				objhospital.setIdHospital(rs.getInt("id_hospital"));
				objhospital.setRazaoSocial(rs.getString("razao_social"));
				objhospital.setNomeFantasia(rs.getString("nome_fantasia"));
				objhospital.setCnpjHospital(rs.getString("cnpj"));
				objhospital.setRua(rs.getString("rua"));
				objhospital.setBairro(rs.getString("bairro"));
				objhospital.setCidade(rs.getString("cidade"));
				objhospital.setEstado(rs.getString("estado"));
				objhospital.setTelefone(rs.getString("telefone"));
				objhospital.setEmail(rs.getString("email"));
				lista.add(objhospital);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}

	public static List<TbHospital> getRegistroByCnpj(String cnpj) {
		List<TbHospital> lista = new ArrayList<TbHospital>();
		String sqllike = cnpj + "%";
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("select * from hospital where cnpj like ?");
			pst.setString(1, sqllike);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				TbHospital objhospital = new TbHospital();
				objhospital.setIdHospital(rs.getInt("id_hospital"));
				objhospital.setRazaoSocial(rs.getString("razao_social"));
				objhospital.setNomeFantasia(rs.getString("nome_fantasia"));
				objhospital.setCnpjHospital(rs.getString("cnpj"));
				objhospital.setRua(rs.getString("rua"));
				objhospital.setBairro(rs.getString("bairro"));
				objhospital.setCidade(rs.getString("cidade"));
				objhospital.setEstado(rs.getString("estado"));
				objhospital.setTelefone(rs.getString("telefone"));
				objhospital.setEmail(rs.getString("email"));
				lista.add(objhospital);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}
}
