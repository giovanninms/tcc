package dao;
import tabelas.TbComponentes;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.sql.*;

import com.mysql.jdbc.PreparedStatement;

public class ComponentesDao {
	private static String selectString = "select * from componentes";

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
	
	public static List<TbComponentes> getAllComponentes(){
		List <TbComponentes> lista = new ArrayList<TbComponentes>();
		
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao.prepareStatement(selectString);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				
				TbComponentes componentes = new TbComponentes();
				componentes.setIdComponente(rs.getInt("id_componentes"));
				componentes.setNomeComponente(rs.getString("nome_componente"));
				componentes.setCodigoComponente(rs.getInt("codigo_componente"));
				componentes.setQuantidadeComponentes(rs.getInt("quantidade"));
				componentes.setCirurgiaUtilizada(rs.getString("cirurgia_utilizada"));
				componentes.setLocalCorpo(rs.getString("local_corpo"));

				lista.add(componentes);
				
			}
			
		} catch (Exception e) {
			System.out.println("ERRO NO GETALLCOMPONENTES " + e);
		}
		return lista;
		
	}
	
	public static List<TbComponentes> getRegistroByCodigo(int codigoComponente) {
		List<TbComponentes> lista = new ArrayList<TbComponentes>();
		String sqllike = codigoComponente + "%";

		
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao.prepareStatement("select * from componentes where codigo_componente like ?");
			pst.setString(1, sqllike);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				TbComponentes componentes = new TbComponentes();
				componentes.setIdComponente(rs.getInt("id_componentes"));
				componentes.setNomeComponente(rs.getString("nome_componente"));
				componentes.setCodigoComponente(rs.getInt("codigo_componente"));
				componentes.setQuantidadeComponentes(rs.getInt("quantidade"));
				componentes.setCirurgiaUtilizada(rs.getString("cirurgia_utilizada"));
				componentes.setLocalCorpo(rs.getString("local_corpo"));
				lista.add(componentes);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}
	
	public static List<TbComponentes> getRegistroByNome(String nomeComponente) {
		List<TbComponentes> lista = new ArrayList<TbComponentes>();
		String sqllike = "%" + nomeComponente + "%";
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("select * from componentes where nome_componente like ?");
			pst.setString(1, sqllike);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				TbComponentes componentes = new TbComponentes();
				componentes.setIdComponente(rs.getInt("id_componentes"));
				componentes.setNomeComponente(rs.getString("nome_componente"));
				componentes.setCodigoComponente(rs.getInt("codigo_componente"));
				componentes.setQuantidadeComponentes(rs.getInt("quantidade"));
				componentes.setCirurgiaUtilizada(rs.getString("cirurgia_utilizada"));
				componentes.setLocalCorpo(rs.getString("local_corpo"));
				lista.add(componentes);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}
	
	public static List<TbComponentes> getRegistroByCirurgiaUtilizada(String cirurgiaUtilizada) {
		List<TbComponentes> lista = new ArrayList<TbComponentes>();
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("select * from componentes where cirurgia_utilizada=?");
			pst.setString(1, cirurgiaUtilizada);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				TbComponentes componentes = new TbComponentes();
				componentes.setIdComponente(rs.getInt("id_componentes"));
				componentes.setNomeComponente(rs.getString("nome_componente"));
				componentes.setCodigoComponente(rs.getInt("codigo_componente"));
				componentes.setQuantidadeComponentes(rs.getInt("quantidade"));
				componentes.setCirurgiaUtilizada(rs.getString("cirurgia_utilizada"));
				componentes.setLocalCorpo(rs.getString("local_corpo"));
				lista.add(componentes);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}
	
	
	public static TbComponentes getRegistroById(int idComponente) {
		TbComponentes componentes = null;

		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("select * from componentes where id_componentes=?");
			pst.setInt(1, idComponente);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				componentes = new TbComponentes();
				componentes.setIdComponente(rs.getInt("id_componentes"));
				System.out.println(rs.getInt("id_componentes"));
				componentes.setNomeComponente(rs.getString("nome_componente"));
				componentes.setCodigoComponente(rs.getInt("codigo_componente"));
				componentes.setQuantidadeComponentes(rs.getInt("quantidade"));
				componentes.setCirurgiaUtilizada(rs.getString("cirurgia_utilizada"));
				componentes.setLocalCorpo(rs.getString("local_corpo"));

			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return componentes;
	}
	public static List<TbComponentes> getByAgendamento(int fkAgendamento) {
	    List<TbComponentes> lista = new ArrayList<>();
	    final String selectString = "SELECT c.nome_componente, c.codigo_componente, c.cirurgia_utilizada, ca.quantidade "
	            + "FROM componentefkagendamento ca "
	            + "JOIN componentes c ON ca.fk_componente = c.id_componentes "
	            + "WHERE ca.fk_agendamento = ?";
	    try {
	        Connection conexao = getConnection();
	        PreparedStatement pst = (PreparedStatement) conexao.prepareStatement(selectString);
	        pst.setInt(1, fkAgendamento);
	        ResultSet rs = pst.executeQuery();

	        while (rs.next()) {
	            TbComponentes componenteAgendamento = new TbComponentes();
	            componenteAgendamento.setNomeComponente(rs.getString("nome_componente"));
	            componenteAgendamento.setCodigoComponente(rs.getInt("codigo_componente"));
	            componenteAgendamento.setCirurgiaUtilizada(rs.getString("cirurgia_utilizada"));
	            componenteAgendamento.setQuantidadeComponentes(rs.getInt("quantidade"));

	            lista.add(componenteAgendamento);
	        }
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    return lista;
	}

	public static int updateComponente(TbComponentes c) {
		int status = 0;

		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao.prepareStatement("UPDATE componentes SET nome_componente=?, codigo_componente=?, quantidade=?, cirurgia_utilizada=?, local_corpo=? WHERE id_componentes=?");
			pst.setString(1, c.getNomeComponente());
			pst.setInt(2, c.getCodigoComponente());
			pst.setInt(3, c.getQuantidadeComponentes());
			pst.setString(4, c.getCirurgiaUtilizada());
			pst.setString(5, c.getLocalCorpo());
			pst.setInt(6, c.getIdComponente());
			status = pst.executeUpdate();

		} catch (Exception e) {
			System.out.println("ERRO NO BANCO " + e);
		}
		return status;
	}
	
	public static int insertComponente(TbComponentes c, HttpServletRequest request) {
	    int status = 0;
	    HttpSession session = request.getSession();
	        try {
	            Connection conexao = getConnection();
	            PreparedStatement pst = (PreparedStatement) conexao.prepareStatement(
	                    "INSERT INTO componentes (nome_componente, codigo_componente, quantidade, cirurgia_utilizada, local_corpo) VALUES (?, ?, ?, ?, ?)");
	            pst.setString(1, c.getNomeComponente());
	            pst.setInt(2, c.getCodigoComponente());
	            pst.setInt(3, c.getQuantidadeComponentes());
	            pst.setString(4, c.getCirurgiaUtilizada());
	            pst.setString(5, c.getLocalCorpo());
	            status = pst.executeUpdate();
	            
	            session = request.getSession();
		        session.setAttribute("msgBanco", "COMPONENTE CADASTRADO COM SUCESSO!!");
	        } catch (SQLException e) {
	        	

				if (e.getErrorCode() == 1062) {

					session.setAttribute("erroInsercao",
							"DADOS DUPLICADO! VERIFIQUE E TENTE NOVAMENTE ");
				}
	            System.out.println("ERRO NO BANCO " + e);
	        }
	        return status;
	    }
	
	public static int deletarComponente(TbComponentes idComponente) {
		int status = 0;
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("DELETE FROM componentes WHERE id_componentes=?");
			pst.setInt(1, idComponente.getIdComponente());
			status = pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("ERRO NO BANCO " + e);
		}
		return status;
	}
	}


