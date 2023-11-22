/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controle;

import java.util.ArrayList;

/**
 *
 * @author artemin
 */
public class Pedido {
    
    private ArrayList<Integer> IdList = new ArrayList<>();
    private ArrayList<Integer> QuantP = new ArrayList<>();
    private ArrayList<Float> PrecoP = new ArrayList<>();
    private int PedidoId = 0;
    private int EstabId = 0;
    private int CliLocal = 0;
    private int IdCli = 0;

    public int getIdCli() {
        return IdCli;
    }

    public void setIdCli(int IdCli) {
        this.IdCli = IdCli;
    }
    
    

    public int getCliLocal() {
        return CliLocal;
    }

    public void setCliLocal(int CliLocal) {
        this.CliLocal = CliLocal;
    }    

    public int getEstabId() {
        return EstabId;
    }

    public void setEstabId(int EstabId) {
        this.EstabId = EstabId;
    }
    
    

    public int getPedidoId() {
        return PedidoId;
    }

    public void setPedidoId(int PedidoId) {
        this.PedidoId = PedidoId;
    }
    
    
    
    public float getPreco(int indiceC)
    {
        return PrecoP.get(indiceC);
    }
    
    public void setPreco(float AddC)
    {
        this.PrecoP.add(AddC);
    }

    public int getIdList(int indiceL) {
        return IdList.get(indiceL);
    }

    public void setIdList(int AddVaL) {
        this.IdList.add(AddVaL);
    }

    public int getQuantP(int indiceQ) {
        return QuantP.get(indiceQ);
    }

    public void setQuantP(int AddValQ) {
        this.QuantP.add(AddValQ);
    }
    
    
    
    
}
