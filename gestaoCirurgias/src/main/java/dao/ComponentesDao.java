package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ComponentesDao {
	
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
	
	
}
