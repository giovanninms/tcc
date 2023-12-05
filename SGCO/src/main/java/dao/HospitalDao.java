/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.DriverManager;
import java.sql.Connection;
import java.util.List;
import java.util.ArrayList;
import tabelas.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



/**
 *
 * @author adolf
 */
public class HospitalDao {
    public static Connection getConnection() {
        Connection con = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tcc","root","1802");
            System.out.println("Conexão com o banco realizada com sucesso");
        } catch (Exception e) {
            System.out.println("Não conectou no banco de dados. Erro: "+e);
        }
        return con;
    }
    
    public static TbHospital getRegistroById (int id){
        
        TbHospital objhospital = null;
        
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement)con.prepareStatement("SELECT * FROM hospital WHERE id_hospital=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
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
        
        }catch (Exception e){
            System.out.println("Erro a consultar o hospital. Erro: "+e);
        }
        System.out.println(objhospital.getIdHospital());
        return objhospital;
    }
    
    
    public static int AtualizarHospital(TbHospital h){
        int status = 0;
        try {
            
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE hospital SET razao_social=?, nome_fantasia=?, cnpj=? WHERE id_hospital=?");
            ps.setString(1, h.getRazaoSocial());
            ps.setString(2,h.getNomeFantasia());
            ps.setString(3, h.getCnpjHospital());
            ps.setInt(4,h.getIdHospital());
            
            status = ps.executeUpdate();
        } catch (Exception e){
            System.out.println("Erro ao atualizar hospital. Erro: "+e);
        }
        return status;       
    }
    
     public static int CadastrarHospital(TbHospital h){
        int status = 0;
        try {
            
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("INSERT INTO hospital (razao_social, nome_fantasia, cnpj, rua, bairro, cidade, estado, telefone, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, h.getRazaoSocial());
            ps.setString(2,h.getNomeFantasia());
            ps.setString(3, h.getCnpjHospital());
            ps.setString(4, h.getRua());
            ps.setString(5, h.getBairro());
            ps.setString(6, h.getCidade());
            ps.setString(7, h.getEstado());
            ps.setString(8, h.getTelefone());
            ps.setString(9, h.getEmail());
            
            
            status = ps.executeUpdate();
        } catch (Exception e){
            System.out.println("Erro ao atualizar hospital. Erro: "+e);
            
        }
        
        return status;       
    }
    
     public static int DeletarHospital(TbHospital h){
        int status = 0;
        try {
            
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("DELETE FROM hospital WHERE id_hospital=?");
            ps.setInt(1,h.getIdHospital());
            
            status = ps.executeUpdate();
        } catch (Exception e){
        	
            System.out.println("Erro ao atualizar hospital. Erro: "+e);
        }
        return status;       
    }
    public static  List <TbHospital> getAllHospital (){ 
        List<TbHospital> lista = new ArrayList<TbHospital>();
    
        try {
            Connection con = getConnection();
         
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM hospital");
            ResultSet rs = ps.executeQuery();
        
            while (rs.next()){
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
        }catch (Exception e){
            System.out.println("Erro ao conectar com o banco. Erro: "+e);
        }  
        return lista;
        
    }

}
