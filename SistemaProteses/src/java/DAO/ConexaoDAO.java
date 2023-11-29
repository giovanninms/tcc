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



/**
 *
 * @author adolf
 */
public class ConexaoDAO {
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
                objhospital.setCnpjHospital(rs.getString("cnpj_hospital"));
                
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
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE hospital SET razao_social=?, nome_fantasia=?, cnpj_hospital=? WHERE id_hospital=?");
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
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("INSERT INTO hospital (razao_social, nome_fantasia, cnpj_hospital) VALUES (?, ?, ?)");
            ps.setString(1, h.getRazaoSocial());
            ps.setString(2,h.getNomeFantasia());
            ps.setString(3, h.getCnpjHospital());
            
            
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
            objhospital.setCnpjHospital(rs.getString("cnpj_hospital"));
            lista.add(objhospital);
        }
        }catch (Exception e){
            System.out.println("Erro ao conectar com o banco. Erro: "+e);
        }  
        return lista;
        
    }

}

