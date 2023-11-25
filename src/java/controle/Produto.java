/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controle;

/**
 *
 * @author artemin
 */
public class Produto {
    
    private int IdProdPed = 0;
    private int IdProd = 0;
    private float ProdPreco = 0;
    private int ProdQuant = 0;
    private String ProdNome = "";

    public String getProdNome() {
        return ProdNome;
    }
    public void setProdNome(String ProdNome) {
        this.ProdNome = ProdNome;
    }      
    public int getIdProdPed() {
        return IdProdPed;
    }
    public void setIdProdPed(int IdProdPed) {
        this.IdProdPed = IdProdPed;
    }
    public int getIdProd() {
        return IdProd;
    }
    public void setIdProd(int IdProd) {
        this.IdProd = IdProd;
    }
    public float getProdPreco() {
        return ProdPreco;
    }
    public void setProdPreco(float ProdPreco) {
        this.ProdPreco = ProdPreco;
    }
    public int getProdQuant() {
        return ProdQuant;
    }
    public void setProdQuant(int ProdQuant) {
        this.ProdQuant = ProdQuant;
    }
    
    
    
}
