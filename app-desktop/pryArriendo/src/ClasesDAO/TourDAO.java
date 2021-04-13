/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesDAO;

import ClasesEntity.tour;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Favio
 */
public class TourDAO {
    
    public boolean ingresarTour(Connection con, tour to) {
        boolean pasoInsert = false;
        String sql = "{call insert_tour(?,?,?,?,?)}";
        
        try {
            CallableStatement pst = con.prepareCall(sql);
            pst.setString(1, to.getRecorrido());
            pst.setString(2, to.getPunto_reunion());
            pst.setDate(3, to.getHorario_salida());
            pst.setDate(4, to.getHorario_llegada());
            pst.setInt(5, to.getValor());
            pst.execute();
            pst.close();
            pasoInsert = true;
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }

//            System.out.println(to.getRecorrido());
//            System.out.println(to.getPunto_reunion());
//            System.out.println(to.getHorario_salida());
//            System.out.println(to.getHorario_llegada());
//            System.out.println(to.getValor());


        return pasoInsert;
    }
    
    
    public boolean modificarTour(Connection con, tour tou) {
        boolean pasoModi = false;
        String sql = "{call update_tour(?,?,?,?,?,?)}";
        
        try {
            CallableStatement pst = con.prepareCall(sql);
            pst.setInt(1, tou.getId_tour());
            pst.setString(2, tou.getRecorrido());
            pst.setString(3, tou.getPunto_reunion());
            pst.setDate(4, tou.getHorario_salida());
            pst.setDate(5, tou.getHorario_llegada());
            pst.setInt(6, tou.getValor());
            pst.execute();
            pst.close();
            pasoModi = true;
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }

            
        return pasoModi;
    }
    
    public boolean eliminarTour(Connection con, int id) {
        boolean pasoEliminar = false;
        String sql = "{call delete_tour (?)}";
        
        try {
            CallableStatement pst = con.prepareCall(sql);
            pst.setInt(1, id);
            pst.execute();
            pst.close();
            pasoEliminar = true;
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return pasoEliminar;
    }
    
    public void listarTour(Connection con, JTable tabla) {
        DefaultTableModel model;
        String [] columnas = {"ID Tour", "Recorrido", "Punto Reunion", "Salida", "Llegada", "Valor"};
        model = new DefaultTableModel(null, columnas);
        
        String sql = "Select * from tour";
        
        String[] filas = new String[6];
        
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                for(int i = 0; i < 6; i++) {
                    filas[i] = rs.getString(i+1);
                }
                model.addRow(filas);
            }
            tabla.setModel(model);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
