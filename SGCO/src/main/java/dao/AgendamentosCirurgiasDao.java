package dao;

import tabelas.TbAgendamentosCirurgias;
import java.util.*;
import java.sql.*;

public class AgendamentosCirurgiasDao {

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

	public static int updateAgendamento(TbAgendamentosCirurgias a) {
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
	
	public static boolean getPaciente(String nomePaciente) {
	    String sql = "SELECT * FROM pacientes WHERE nome = ?";
	    try {
	        Connection conexao = getConnection();
	        PreparedStatement pst = conexao.prepareStatement(sql);
	        pst.setString(1, nomePaciente);
	        System.out.println(nomePaciente);
	        ResultSet rs = pst.executeQuery();
	        return rs.next(); 
	    } catch (Exception e) {
	        System.out.println("ERRO na getPaciente " + e);
	    }
	    System.out.println(getPaciente(nomePaciente));
	    return false;
	}
	
	public static boolean getHospital(String nomeHospital) {
	    String sql = "SELECT * FROM hospital WHERE nome = ?";
	    try {
	        Connection conexao = getConnection();
	        PreparedStatement pst = conexao.prepareStatement(sql);
	        pst.setString(1, nomeHospital);
	        System.out.println(nomeHospital);
	        ResultSet rs = pst.executeQuery();
	        return rs.next(); 
	    } catch (Exception e) {
	        System.out.println("ERRO na getHospital " + e);
	    }
	    System.out.println(getPaciente(nomeHospital));
	    return false;
	
	}
	
	public static boolean getMedico(String nomeMedico) {
	    String sql = "SELECT * FROM hospital WHERE nome_fantasia = ?";
	    try {
	        Connection conexao = getConnection();
	        PreparedStatement pst = conexao.prepareStatement(sql);
	        pst.setString(1, nomeMedico);
	        System.out.println(nomeMedico);
	        ResultSet rs = pst.executeQuery();
	        return rs.next(); 
	    } catch (Exception e) {
	        System.out.println("ERRO na getMedico " + e);
	    }
	    System.out.println(getPaciente(nomeMedico));
	    return false;
	
	}

	public static int insertAgendamento(TbAgendamentosCirurgias a) {
	    int status = 0;
	    System.out.println(a.getStgFkMedico());
	    if (!getPaciente(a.getStgFkPaciente()) && !getHospital(a.getStgFkHospital()) && !getMedico(a.getStgFkMedico())) {
	        System.out.println("Paciente, hospital ou médico não encontrado. Inserção cancelada.");
	        return status;
	    } else {
	        try {
	            Connection conexao = getConnection();
	            PreparedStatement pst = conexao.prepareStatement(
	                    "INSERT INTO agendamentos_cirurgias (local_corpo, tipo_cirurgia, status, data_hora, fk_paciente, fk_hospital, fk_medico) VALUES (?, ?, ?, ?, (SELECT id_paciente FROM pacientes WHERE nome = ?), (SELECT id_hospital FROM hospital WHERE nome_fantasia = ?), (SELECT id_medico FROM medico WHERE nome = ?))");
	            pst.setString(1, a.getLocalCorpo());
	            pst.setString(2, a.getTipoCirurgia());
	            pst.setString(3, a.getStatusAgendamento());
	            pst.setString(4, a.getDataHoraString());
	            pst.setString(5, a.getStgFkPaciente());
	            System.out.println(a.getStgFkPaciente());
	            pst.setString(6, a.getStgFkHospital());
	            System.out.println(a.getStgFkHospital());
	            pst.setString(7, a.getStgFkMedico());
	            System.out.println(a.getStgFkMedico());
	            status = pst.executeUpdate();
	        } catch (Exception e) {
	            System.out.println("ERRO NO BANCO " + e);
	        }
	        return status;
	    }
	}

	public static List<TbAgendamentosCirurgias> getAllAgendamentos() {
		List<TbAgendamentosCirurgias> lista = new ArrayList<TbAgendamentosCirurgias>();
		 final String selectString = "SELECT ac.*, p.nome AS nome_paciente, h.nome_fantasia AS nome_hospital, m.nome AS nome_medico " +
                "FROM agendamentos_cirurgias ac " +
                "JOIN pacientes p ON ac.fk_paciente = p.id_paciente " +
                "JOIN hospital h ON ac.fk_hospital = h.id_hospital " +
                "JOIN medico m ON ac.fk_medico = m.id_medico";
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = conexao.prepareStatement(selectString);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				TbAgendamentosCirurgias agendamentos = new TbAgendamentosCirurgias();
				agendamentos.setIdAgendamento(rs.getInt("idagendamentos_cirurgias"));
				agendamentos.setLocalCorpo(rs.getString("local_corpo"));
				agendamentos.setTipoCirurgia(rs.getString("tipo_cirurgia"));
				agendamentos.setStatusAgendamento(rs.getString("status"));
				agendamentos.setDataHoraViwer(rs.getTimestamp("data_hora"));
				agendamentos.setStgFkPaciente(rs.getString("nome_paciente"));
                agendamentos.setStgFkHospital(rs.getString("nome_hospital"));
                agendamentos.setStgFkMedico(rs.getString("nome_medico"));
				lista.add(agendamentos);

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}

	public static TbAgendamentosCirurgias getRegistroById(int idAgendamento) {
	    TbAgendamentosCirurgias agendamentosCirurgias = null;

	    try {
	        Connection conexao = getConnection();
	        PreparedStatement pst = conexao.prepareStatement("SELECT ac.*, p.nome AS nome_paciente, h.nome_fantasia AS nome_hospital, m.nome AS nome_medico " +
		            "FROM agendamentos_cirurgias ac " +
		            "JOIN pacientes p ON ac.fk_paciente = p.id_paciente " +
		            "JOIN hospital h ON ac.fk_hospital = h.id_hospital " +
		            "JOIN medico m ON ac.fk_medico = m.id_medico " +
		            "WHERE ac.idagendamentos_cirurgias = ?");
	        pst.setInt(1, idAgendamento);
	        ResultSet rs = pst.executeQuery();

	        while (rs.next()) {
	            agendamentosCirurgias = new TbAgendamentosCirurgias();
	            agendamentosCirurgias.setIdAgendamento(rs.getInt("idagendamentos_cirurgias"));
	            System.out.println(rs.getInt("idagendamentos_cirurgias"));
	            agendamentosCirurgias.setLocalCorpo(rs.getString("local_corpo"));
	            agendamentosCirurgias.setTipoCirurgia(rs.getString("tipo_cirurgia"));
	            agendamentosCirurgias.setStatusAgendamento(rs.getString("status"));
	            agendamentosCirurgias.setDataHoraString(rs.getString("data_hora"));
	            agendamentosCirurgias.setStgFkPaciente(rs.getString("nome_paciente"));
	            agendamentosCirurgias.setStgFkHospital(rs.getString("nome_hospital"));
                agendamentosCirurgias.setStgFkMedico(rs.getString("nome_medico"));
	        }

	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    return agendamentosCirurgias;
	}


	public static int deletarAgendamento(TbAgendamentosCirurgias agendamento) {
		int status = 0;
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("DELETE FROM agendamentos_cirurgias WHERE idagendamentos_cirurgias=?");
			pst.setInt(1, agendamento.getIdAgendamento());
			status = pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("ERRO NO BANCO " + e);
		}
		return status;
	}

}
