package dao;

import tabelas.TbComponentes;
import java.util.*;
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
				lista.add(componentes);
				System.out.println("fumegou");
				System.out.println(rs.getInt("id_componentes"));
			}
			
		} catch (Exception e) {
			System.out.println("ERRO NO GETALLCOMPONENTES " + e);
		}
		return lista;
		
	}
	
	public static List<TbComponentes> getRegistroByCodigo(int codigoComponente) {
		List<TbComponentes> lista = new ArrayList<TbComponentes>();
		
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao.prepareStatement("select * from componentes where codigo_componente=?");
			pst.setInt(1, codigoComponente);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				TbComponentes componentes = new TbComponentes();
				componentes.setIdComponente(rs.getInt("id_componentes"));
				componentes.setNomeComponente(rs.getString("nome_componente"));
				componentes.setCodigoComponente(rs.getInt("codigo_componente"));
				componentes.setQuantidadeComponentes(rs.getInt("quantidade"));
				componentes.setCirurgiaUtilizada(rs.getString("cirurgia_utilizada"));
				lista.add(componentes);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}
	
	public static List<TbComponentes> getRegistroByNome(String nomeComponente) {
		List<TbComponentes> lista = new ArrayList<TbComponentes>();
		
		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao
					.prepareStatement("select * from componentes where nome_componente=?");
			pst.setString(1, nomeComponente);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				TbComponentes componentes = new TbComponentes();
				componentes.setIdComponente(rs.getInt("id_componentes"));
				componentes.setNomeComponente(rs.getString("nome_componente"));
				componentes.setCodigoComponente(rs.getInt("codigo_componente"));
				componentes.setQuantidadeComponentes(rs.getInt("quantidade"));
				componentes.setCirurgiaUtilizada(rs.getString("cirurgia_utilizada"));
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

			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return componentes;
	}
	
	public static int updateComponente(TbComponentes c) {
		int status = 0;

		try {
			Connection conexao = getConnection();
			PreparedStatement pst = (PreparedStatement) conexao.prepareStatement("UPDATE componentes SET nome_componente=?, codigo_componente=?, quantidade=?, cirurgia_utilizada=? WHERE id_componentes=?");
			pst.setString(1, c.getNomeComponente());
			pst.setInt(2, c.getCodigoComponente());
			pst.setInt(3, c.getQuantidadeComponentes());
			pst.setString(4, c.getCirurgiaUtilizada());
			pst.setInt(5, c.getIdComponente());
			status = pst.executeUpdate();

		} catch (Exception e) {
			System.out.println("ERRO NO BANCO " + e);
		}
		return status;
	}
	
	public static int insertComponente(TbComponentes c) {
	    int status = 0;
	    
	        try {
	            Connection conexao = getConnection();
	            PreparedStatement pst = (PreparedStatement) conexao.prepareStatement(
	                    "INSERT INTO componentes (nome_componente, codigo_componente, quantidade, cirurgia_utilizada) VALUES (?, ?, ?, ?)");
	            pst.setString(1, c.getNomeComponente());
	            pst.setInt(2, c.getCodigoComponente());
	            pst.setInt(3, c.getQuantidadeComponentes());
	            pst.setString(4, c.getCirurgiaUtilizada());
	            status = pst.executeUpdate();
	        } catch (Exception e) {
	            System.out.println("ERRO NO BANCO " + e);
	        }
	        return status;
	    }
	}