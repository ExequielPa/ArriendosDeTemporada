/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesEntity;

/**
 *
 * @author Favio
 */
public class departamento {
    
    private int id_depto;
    private int num_depto;
    private String direccion;
    private String Descripcion;
    private String region;
    private String estado;

    public departamento() {
    }

    public departamento(int id_depto, int num_depto, String direccion, String Descripcion, String region, String estado) {
        this.id_depto = id_depto;
        this.num_depto = num_depto;
        this.direccion = direccion;
        this.Descripcion = Descripcion;
        this.region = region;
        this.estado = estado;
    }

    public int getId_depto() {
        return id_depto;
    }

    public void setId_depto(int id_depto) {
        this.id_depto = id_depto;
    }

    public int getNum_depto() {
        return num_depto;
    }

    public void setNum_depto(int num_depto) {
        this.num_depto = num_depto;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "departamento{" + "id_depto=" + id_depto + ", num_depto=" + num_depto + ", direccion=" + direccion + ", Descripcion=" + Descripcion + ", region=" + region + ", estado=" + estado + '}';
    }
    
    
    
}
