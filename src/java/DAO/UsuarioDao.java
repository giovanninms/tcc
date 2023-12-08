/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.DriverManager;
import java.sql.Connection;
import java.util.List;
import java.util.ArrayList;
import Tabelas.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UsuarioDao {
    public static Connection getConnection() {
        Connection con = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgpo","root","1234");
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
                objusuarios.setTelefoneUsuario(rs.getString("telefone_usuario"));
                
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
            objusuarios.setTelefoneUsuario(rs.getString("telefone_usuario"));
            
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
            ps.setString(7, h.getTelefoneUsuario());
            
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
            ps.setString(4, h.getTelefoneUsuario());
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
            
         
            Connection con = getConnection();
            
            PreparedStatement ps1 = (PreparedStatement) con.prepareStatement("SELECT * from usuarios WHERE login_usuario=? AND tipo_usuario = ? OR tipo_usuario = ?");         
            ps1.setString(1, h.getLoginUsuario());
            ps1.setString(2,"Hospital");
            ps1.setString(3,"Distribuidora");
            ResultSet rs1 = ps1.executeQuery();
            
                       
            while (rs1.next()){
                
                if (rs1.getString("login_usuario").equals(h.getLoginUsuario())){
                    usuarioValidado = true;
                    
                    if (rs1.getString("tipo_usuario").equals("Hospital")){
                        status = 1;
                    }
                    
                    else if (rs1.getString("tipo_usuario").equals("Distribuidora")){
                        status = 2;
                    }
                }
            }
        
            
        } catch (Exception e){
            System.out.println("Erro ao logar. Erro: "+e);
        }
        return status;       
    }
   
   
    }

