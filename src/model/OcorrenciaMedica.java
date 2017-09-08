/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Renan Roeder, 09-08-2017
 */
public class OcorrenciaMedica {
    private TipoOcorrenciaMedica tipoOcorrenciaMedica;
    private Emissor emissor;
    private int cep, numeroResidencia, id;
    private String rua, logradouro;

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

    public TipoOcorrenciaMedica getTipoOcorrenciaMedica() {
        return tipoOcorrenciaMedica;
    }

    public void setTipoOcorrenciaMedica(TipoOcorrenciaMedica tipoOcorrenciaMedica) {
        this.tipoOcorrenciaMedica = tipoOcorrenciaMedica;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}