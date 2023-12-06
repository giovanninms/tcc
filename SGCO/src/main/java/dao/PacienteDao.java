package dao;

import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import tabelas.TbPaciente;

public class PacienteDao {
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
	
	public static List<TbPaciente> getAllPacientes() {
		List<TbPaciente> lista = new ArrayList<TbPaciente>();
		 final String selectString = "select * from pacientes";
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = conexao.prepareStatement(selectString);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				TbPaciente paciente = new TbPaciente();
				paciente.setIdPaciente(rs.getInt("id_paciente"));
				paciente.setNomePaciente(rs.getString("nome"));
				paciente.setDataNascimento(rs.getDate("data_nascimento"));
				paciente.setRgPaciente(rs.getString("RG"));
				paciente.setCpfPaciente(rs.getString("CPF"));
				paciente.setCelular(rs.getString("celular"));
				paciente.setAlturaCm(rs.getInt("altura_cm"));
				paciente.setPesoKg(rs.getFloat("peso_kg"));
				paciente.setSexo(rs.getString("sexo"));
				paciente.setEmail(rs.getString("email"));
				lista.add(paciente);

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}
	
	public static int insertPaciente(TbPaciente c, HttpServletRequest request) {
		int status = 0;
		String sqlString = ("insert into pacientes (nome, data_nascimento, RG, CPF, celular, altura_cm, peso_kg, sexo, email) values (?, ?, ?, ?, ?, ?, ?, ?, ?)");
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = conexao.prepareStatement(sqlString);
			pst.setString(1, c.getNomePaciente());
			pst.setString(2, c.getDataNascimentoStg());
			pst.setString(3, c.getCpfPaciente());
			pst.setString(4, c.getCpfPaciente());
			pst.setString(5, c.getCelular());
			pst.setInt(6, c.getAlturaCm());
			pst.setFloat(7, c.getPesoKg());
			pst.setString(8, c.getSexo());
			pst.setString(9, c.getEmail());
			status = pst.executeUpdate();
			
		} catch (SQLException e) {
			HttpSession session = request.getSession();

			if (e.getErrorCode() == 1062) {

				session.setAttribute("erroInsercao",
						"DADOS DUPLICADO! VERIFIQUE E TENTE NOVAMENTE ");
			}
		}	
		return status;
	}
	
	public static TbPaciente getRegistroById(int idPaciente) {
		TbPaciente paciente = null;

		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("select * from pacientes where id_paciente=?");
			pst.setInt(1, idPaciente);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				paciente = new TbPaciente();
				paciente.setIdPaciente(rs.getInt("id_paciente"));
				paciente.setNomePaciente(rs.getString("nome"));
				paciente.setDataNascimento(rs.getDate("data_nascimento"));
				paciente.setRgPaciente(rs.getString("RG"));
				paciente.setCpfPaciente(rs.getString("CPF"));
				paciente.setCelular(rs.getString("celular"));
				paciente.setAlturaCm(rs.getInt("altura_cm"));
				paciente.setPesoKg(rs.getFloat("peso_kg"));
				paciente.setEmail(rs.getString("email"));
				paciente.setSexo(rs.getString("sexo"));
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return paciente;
	}
	
	public static int deletarPaciente(TbPaciente idPaciente, HttpServletRequest request) {
		int status = 0;
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("DELETE FROM pacientes WHERE id_paciente=?");
			pst.setInt(1, idPaciente.getIdPaciente());
			status = pst.executeUpdate();
		} catch (SQLException e) {
			HttpSession session = request.getSession();

			if (e.getErrorCode() == 1451) {

				session.setAttribute("erroInsercao",
						"NÃO FOI POSSIVEL EXLUIR PACIENTE! AGENDAMENTO EM ANDAMENTO ");
			}
		}
		return status;
	}
	public static int updatePaciente(TbPaciente p) {
		int status = 0;

		try {
			Connection conexao = getConnection();
			PreparedStatement pst = conexao.prepareStatement(
					"UPDATE pacientes SET nome=?, data_nascimento=?, RG=?, CPF=?, celular=?, altura_cm=?, peso_kg=?, sexo=?, email=? WHERE id_paciente=?");
			pst.setString(1, p.getNomePaciente());
			pst.setString(2, p.getDataNascimentoStg());
			pst.setString(3, p.getRgPaciente());
			pst.setString(4, p.getCpfPaciente());
			pst.setString(5, p.getCelular());
			pst.setInt(6, p.getAlturaCm());
			pst.setFloat(7, p.getPesoKg());
			pst.setString(8,p.getSexo());
			pst.setString(9, p.getEmail());
			pst.setInt(10, p.getIdPaciente());
			status = pst.executeUpdate();

		} catch (Exception e) {
			System.out.println("ERRO NO BANCO " + e);
		}
		return status;
	}
	public static List<TbPaciente> getRegistroByNome(String nomeMedico) {
		List<TbPaciente> lista = new ArrayList<TbPaciente>();
		String sqllike = "%" + nomeMedico + "%";
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("select * from pacientes where nome like ?");
			pst.setString(1, sqllike);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				TbPaciente paciente = new TbPaciente();
				paciente.setIdPaciente(rs.getInt("id_paciente"));
				paciente.setNomePaciente(rs.getString("nome"));
				paciente.setDataNascimento(rs.getDate("data_nascimento"));
				paciente.setRgPaciente(rs.getString("RG"));
				paciente.setCpfPaciente(rs.getString("CPF"));
				paciente.setCelular(rs.getString("celular"));
				paciente.setAlturaCm(rs.getInt("altura_cm"));
				paciente.setPesoKg(rs.getFloat("peso_kg"));
				paciente.setSexo(rs.getString("sexo"));
				paciente.setEmail(rs.getString("email"));
				lista.add(paciente);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}
	public static List<TbPaciente> getRegistroByRg(String rg) {
		List<TbPaciente> lista = new ArrayList<TbPaciente>();
		String sqllike = rg + "%";
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("select * from pacientes where RG like ?");
			pst.setString(1, sqllike);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				TbPaciente paciente = new TbPaciente();
				paciente.setIdPaciente(rs.getInt("id_paciente"));
				paciente.setNomePaciente(rs.getString("nome"));
				paciente.setDataNascimento(rs.getDate("data_nascimento"));
				paciente.setRgPaciente(rs.getString("RG"));
				paciente.setCpfPaciente(rs.getString("CPF"));
				paciente.setCelular(rs.getString("celular"));
				paciente.setAlturaCm(rs.getInt("altura_cm"));
				paciente.setPesoKg(rs.getFloat("peso_kg"));
				paciente.setSexo(rs.getString("sexo"));
				paciente.setEmail(rs.getString("email"));
				lista.add(paciente);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}
	public static List<TbPaciente> getRegistroByCpf(String cpf) {
		List<TbPaciente> lista = new ArrayList<TbPaciente>();
		String sqllike = cpf + "%";
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("select * from pacientes where CPF like ?");
			pst.setString(1, sqllike);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				TbPaciente paciente = new TbPaciente();
				paciente.setIdPaciente(rs.getInt("id_paciente"));
				paciente.setNomePaciente(rs.getString("nome"));
				paciente.setDataNascimento(rs.getDate("data_nascimento"));
				paciente.setRgPaciente(rs.getString("RG"));
				paciente.setCpfPaciente(rs.getString("CPF"));
				paciente.setCelular(rs.getString("celular"));
				paciente.setAlturaCm(rs.getInt("altura_cm"));
				paciente.setPesoKg(rs.getFloat("peso_kg"));
				paciente.setSexo(rs.getString("sexo"));
				paciente.setEmail(rs.getString("email"));
				lista.add(paciente);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}
}
