package model;

public class BaseOcorrencia {
    private String rua;
    private int cep;
    private int numeroResidencia;
    private int id;
    private BaseTipoOcorrencia baseTipoOcorrencia;
    private Emissor emissor;

    public Emissor getEmissor() {
        return emissor;
    }

    public void setEmissor(Emissor emissor) {
        this.emissor = emissor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public BaseTipoOcorrencia getBaseTipoOcorrencia() {
        return baseTipoOcorrencia;
    }

    public void setBaseTipoOcorrencia(BaseTipoOcorrencia baseTipoOcorrencia) {
        this.baseTipoOcorrencia = baseTipoOcorrencia;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public int getCep() {
        return cep;
    }

    public void setCep(int cep) {
        this.cep = cep;
    }

    public int getNumeroResidencia() {
        return numeroResidencia;
    }

    public void setNumeroResidencia(int numeroResidencia) {
        this.numeroResidencia = numeroResidencia;
    }

    public String endereco(){
        return rua + " - " + numeroResidencia ;
    }

    @Override
    public String toString(){
        return endereco() + baseTipoOcorrencia ;
    }

}
