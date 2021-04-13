/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesDTO;

import ClasesDAO.TourDAO;
import ClasesEntity.tour;
import conexionBD.conexion;
import java.sql.Connection;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.JTable;

/**
 *
 * @author Favio
 */
public class TourDTO {
    
    private TourDAO tDAO = new TourDAO();
    private boolean valida;
    
    public boolean ingresarTour(tour ins) {
        valida = false;
        Connection conn = conexion.getConnection();
        try {
            valida = tDAO.ingresarTour(conn, ins);
            //conn.rollback();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage());
            }
        }
        return valida;
    }
    
     public boolean modificarTour(tour tou) {
        valida = false;
        Connection conn = conexion.getConnection();
        try {
            valida = tDAO.modificarTour(conn, tou);
            //conn.rollback();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage());
            }
        }
        return valida;
    }
    
     public boolean eliminarTour(int id) {
        valida = false;
        Connection conn = conexion.getConnection();
        try {
            valida = tDAO.eliminarTour(conn, id);
            //conn.rollback();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage());
            }
        }
        return valida;
    }
    
    public void listarTour(JTable tabla) {
        Connection conn = conexion.getConnection();
        tDAO.listarTour(conn, tabla);
        try {
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
