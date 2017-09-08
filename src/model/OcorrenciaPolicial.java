/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Wanderson Ferreira
 */
public class OcorrenciaPolicial {

    private TipoOcorrenciaPolicial tipoOcorrenciaPolicial;
    private Emissor emissor;
    private int cep, numeroResidencia, id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String rua, logradouro;

    public TipoOcorrenciaPolicial getTipoOcorrenciaPolicial() {
        return tipoOcorrenciaPolicial;
    }

    public void setTipoOcorrenciaPolicial(TipoOcorrenciaPolicial tipoOcorrenciaPolicial) {
        this.tipoOcorrenciaPolicial = tipoOcorrenciaPolicial;
    }

    public Emissor getEmissor() {
        return emissor;
    }

    public void setEmissor(Emissor emissor) {
        this.emissor = emissor;
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

}