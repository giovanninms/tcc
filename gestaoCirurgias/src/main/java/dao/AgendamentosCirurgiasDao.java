package dao;

import tabelas.AgendamentosCirurgias;

import java.util.*;
import java.sql.*;

public class AgendamentosCirurgiasDao {
	private static String selectString = "select * from agendamentos_cirurgias";

	public static Connection getConnection() {

		Connection conexao = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexao = DriverManager.getConnection("jdbc:mysql://aws.connect.psdb.cloud/ag_database?sslMode=VERIFY_IDENTITY","gu0b5jwy3w71i5rv7q21","pscale_pw_UxFoeSHGNzEkBNrMJsxepaRbFJOpPxSDu0b8MFeZnJl");
		} catch (Exception e) {
			System.out.println(e);
		}
		return conexao;
	}

	public static int updateAgendamento(AgendamentosCirurgias a) {
		int status = 0;

		try {
			Connection conexao = getConnection();
			PreparedStatement pst = conexao.prepareStatement(
					"UPDATE agendamentos_cirurgias SET local_corpo=?, tipo_cirurgia=?, status=?, data_hora=? WHERE idagendamentos_cirurgias=?");
			pst.setString(1, a.getLocalCorpo());
			pst.setString(2, a.getTipoCirurgia());
			pst.setString(3, a.getStatusAgendamento());
			pst.setString(4, a.getDataHoraString());
			pst.setInt(5, a.getIdAgendamento());
			status = pst.executeUpdate();

		} catch (Exception e) {
			System.out.println("ERRO NO BANCO " + e);
		}
		return status;
	}

	public static int insertAgendamento(AgendamentosCirurgias a) {
		int status = 0;

		try {
			Connection conexao = getConnection();
			PreparedStatement pst = conexao.prepareStatement(
					"INSERT INTO agendamentos_cirurgias (local_corpo, tipo_cirurgia, status, data_hora) VALUES (?, ?, ?, ?)");
			pst.setString(1, a.getLocalCorpo());
			pst.setString(2, a.getTipoCirurgia());
			System.out.println(a.getTipoCirurgia());
			pst.setString(3, a.getStatusAgendamento());
			pst.setString(4, a.getDataHoraString());
			System.out.println(a.getDataHoraString());
			status = pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("ERRO NO BANCO " + e);
		}
		return status;
	}

	public static List<AgendamentosCirurgias> getAllAgendamentos() {
		List<AgendamentosCirurgias> lista = new ArrayList<AgendamentosCirurgias>();
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = conexao.prepareStatement(selectString);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				AgendamentosCirurgias agendamentos = new AgendamentosCirurgias();
				agendamentos.setIdAgendamento(rs.getInt("idagendamentos_cirurgias"));
				agendamentos.setLocalCorpo(rs.getString("local_corpo"));
				agendamentos.setTipoCirurgia(rs.getString("tipo_cirurgia"));
				agendamentos.setStatusAgendamento(rs.getString("status"));
				agendamentos.setDataHoraViwer(rs.getTimestamp("data_hora"));
				lista.add(agendamentos);

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}

	public static AgendamentosCirurgias getRegistroById(int idAgendamento) {
		AgendamentosCirurgias agendamentosCirurgias = null;

		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("select * from agendamentos_cirurgias where idagendamentos_cirurgias=?");
			pst.setInt(1, idAgendamento);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				agendamentosCirurgias = new AgendamentosCirurgias();
				agendamentosCirurgias.setIdAgendamento(rs.getInt("idagendamentos_cirurgias"));
				agendamentosCirurgias.setLocalCorpo(rs.getString("local_corpo"));
				agendamentosCirurgias.setTipoCirurgia(rs.getString("tipo_cirurgia"));
				agendamentosCirurgias.setStatusAgendamento(rs.getString("status"));
				agendamentosCirurgias.setDataHoraString(rs.getString("data_hora"));

			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return agendamentosCirurgias;
	}

	public static int deletarAgendamento(AgendamentosCirurgias ca) {
		int status = 0;
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("DELETE FROM agendamentos_cirurgias WHERE idagendamentos_cirurgias=?");
			pst.setInt(1, ca.getIdAgendamento());
			System.out.println(ca.getIdAgendamento());
			status = pst.executeUpdate();

		} catch (Exception e) {
			System.out.println("ERRO NO BANCO " + e);
		}
		return status;
	}
}
