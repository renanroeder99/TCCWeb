package model;

public class BaseOcorrencia {

    private BaseTipoOcorrencia baseTipoOcorrencia;

    private Emissor emissor;

    public Emissor getEmissor() {
        return emissor;
    }

    public void setEmissor(Emissor emissor) {
        this.emissor = emissor;
    }

    private String rua, logradouro;
    private int cep;
    private int numeroResidencia;
    private int id;

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

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
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
}
