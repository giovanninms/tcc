package dao;
import java.sql.*;
import java.util.*;
import tabelas.*;

public class UsuarioDao {
    public static Connection getConnection() {
        Connection con = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tcc","root","1802");
            //con = DriverManager.getConnection("jdbc:mysql://aws.connect.psdb.cloud/ag_database?sslMode=VERIFY_IDENTITY","gu0b5jwy3w71i5rv7q21","pscale_pw_UxFoeSHGNzEkBNrMJsxepaRbFJOpPxSDu0b8MFeZnJl");
            System.out.println("Conexão com o banco realizada com sucesso");
        } catch (Exception e) {
            System.out.println("Não conectou no banco de dados. Erro:"+e);
        }
        return con;
    }
    
       public static TbUsuarios getRegistroById (int id){
        
        TbUsuarios objusuarios = null;
        
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement)con.prepareStatement("SELECT * FROM usuarios WHERE id_usuario=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                objusuarios = new TbUsuarios();
                objusuarios.setIdUsuario(rs.getInt("id_usuario"));
                objusuarios.setLoginUsuario(rs.getString("login_usuario"));
                objusuarios.setNomeUsuario(rs.getString("nome_usuario"));
                objusuarios.setEmailUsuario(rs.getString("email_usuario"));
                objusuarios.setTelefoneUsuario(rs.getInt("telefone_usuario"));
                
            }
        
        }catch (Exception e){
            System.out.println("Erro a consultar o hospital. Erro: "+e);
        }
        System.out.println(objusuarios.getIdUsuario());
        return objusuarios;
    }
    
   public static  List <TbUsuarios> getAllUsuarios (){ 
        List<TbUsuarios> lista = new ArrayList<TbUsuarios>();
    
        try {
            Connection con = getConnection();
         
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuarios");
            ResultSet rs = ps.executeQuery();
        
            while (rs.next()){
            TbUsuarios objusuarios = new TbUsuarios();
            objusuarios.setIdUsuario(rs.getInt("id_usuario"));
            objusuarios.setLoginUsuario(rs.getString("login_usuario"));
            objusuarios.setNomeUsuario(rs.getString("nome_usuario"));
            objusuarios.setEmailUsuario(rs.getString("email_usuario"));
            objusuarios.setTelefoneUsuario(rs.getInt("telefone_usuario"));
            
            lista.add(objusuarios);
        }
        }catch (Exception e){
            System.out.println("Erro ao conectar com o banco. Erro: "+e);
        }  
        return lista;
        
    }
   public static int CadastrarUsuario(TbUsuarios h){
        int status = 0;
        try {
            
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("INSERT INTO usuarios (login_usuario, senha_usuario, tipo_usuario, nivel_usuario, nome_usuario, email_usuario, telefone_usuario) VALUES (?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, h.getLoginUsuario());
            ps.setString(2, h.getSenhaUsuario());
            ps.setString(3,h.getTipoUsuario());
            ps.setString(4, h.getNivelUsuario());
            ps.setString(5, h.getNomeUsuario());
            ps.setString(6, h.getEmailUsuario());
            ps.setInt(7, h.getTelefoneUsuario());
            
            status = ps.executeUpdate();
        } catch (Exception e){
            System.out.println("Erro ao cadatrar usuario. Erro: "+e);
        }
        
        return status;       
    }
    
   public static int AtualizarUsuario(TbUsuarios h){
        int status = 0;
        try {
            
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE usuarios SET login_usuario=?, nome_usuario=?, email_usuario=?, telefone_usuario=? WHERE id_usuario=?");
                      
            ps.setString(1, h.getLoginUsuario());
            ps.setString(2, h.getNomeUsuario());
            ps.setString(3, h.getEmailUsuario());
            ps.setInt(4, h.getTelefoneUsuario());
            ps.setInt(5, h.getIdUsuario());
            
            status = ps.executeUpdate();
        } catch (Exception e){
            System.out.println("Erro ao atualizar hospital. Erro: "+e);
        }
        return status;       
    }
   public static int ValidarUsuario(TbUsuarios h){
        
        int status = 0;
        
        try {
            boolean usuarioValidado = false;
            boolean senhaValidado = false;
            Connection con = getConnection();
            
            PreparedStatement ps1 = (PreparedStatement) con.prepareStatement("SELECT * from usuarios WHERE login_usuario=?");         
            ps1.setString(1, h.getLoginUsuario()); 
            ResultSet rs1 = ps1.executeQuery();
            
            PreparedStatement ps2 = (PreparedStatement) con.prepareStatement("SELECT * from usuarios WHERE senha_usuario=?");
            ps2.setString(1, h.getSenhaUsuario());
            ResultSet rs2 = ps2.executeQuery();
            
            while (rs1.next()){
                
                if (rs1.getString("login_usuario").equals(h.getLoginUsuario())){
                    usuarioValidado = true;
                }
            }
                
            while (rs2.next()){
                
                if (rs2.getString("senha_usuario").equals(h.getSenhaUsuario())){
                    senhaValidado = true;
                }
            }
            if (usuarioValidado == true && senhaValidado == true){
                 status = 1;
                 
            }   
        
        } catch (Exception e){
            System.out.println("Erro ao logar. Erro: "+e);
        }
        return status;       
    }
   
   
    }

