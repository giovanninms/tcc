/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author adolf
 */
import Tabelas.AgendamentosCirurgias;

import java.util.*;
import java.sql.*;




public class AgendamentosCirurgiasDao {
	private static String selectString = "select * from agendamentos_cirurgias";

	public static Connection getConnection() {

		Connection conexao = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/tcc", "root", "1802");
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
			PreparedStatement pst = conexao.prepareStatement("UPDATE agendamentos_cirurgias SET local_corpo=?, tipo_cirurgia=?, status=?  WHERE idagendamentos_cirurgias=?");
			pst.setString(1, a.getLocalCorpo());
			pst.setString(2, a.getTipoCirurgia());
			pst.setString(3, a.getStatusAgendamento());		
			pst.setInt(4, a.getIdAgendamento());
			status = pst.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("ERRO NO BANCO " + e);
		}
		return status;
	}
	public static int deleteAgendamento(AgendamentosCirurgias a) {
		int status = 0;
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao.prepareStatement("delete from agendamentos_cirurgias where idagendamentos_cirurgias =?");
			pst.setInt(1,  a.getIdAgendamento());
			System.out.println(a.getIdAgendamento());
			status = pst.executeUpdate();
			System.out.println(status);
			
		} catch (Exception e) {
			System.out.println("ERRO NO BANCO " + e);
		}
		return status;
	}
	public static int insertAgendamento(AgendamentosCirurgias a) {
		int status = 0;
		
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = conexao.prepareStatement("INSERT INTO agendamentos_cirurgias (local_corpo, tipo_cirurgia, status) VALUE (?, ?, ?)");
			pst.setString(1, a.getLocalCorpo());
			pst.setString(2, a.getTipoCirurgia());
			pst.setString(3, a.getStatusAgendamento());
			status = pst.executeUpdate();			
		}catch (Exception e) {
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
		    PreparedStatement pst = (PreparedStatement) conexao.prepareStatement("select * from agendamentos_cirurgias where idagendamentos_cirurgias=?");
			pst.setInt(1, idAgendamento);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				agendamentosCirurgias = new AgendamentosCirurgias();
				agendamentosCirurgias.setIdAgendamento(rs.getInt("idagendamentos_cirurgias"));
				agendamentosCirurgias.setLocalCorpo(rs.getString("local_corpo"));
				agendamentosCirurgias.setTipoCirurgia(rs.getString("tipo_cirurgia"));
				agendamentosCirurgias.setStatusAgendamento(rs.getString("status"));
			
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return agendamentosCirurgias;
	}
}
	


