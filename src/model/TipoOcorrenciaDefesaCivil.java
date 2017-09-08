package model;

/**
 *
 * @author 98930
 */
public class TipoOcorrenciaDefesaCivil {
    private String
            localizacao, acontecimento, descricao;
     private boolean chamarAmbulancia;
     private int codigo;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public boolean isChamarAmbulancia() {
        return chamarAmbulancia;
    }

    public void setChamarAmbulancia(boolean chamarAmbulancia) {
        this.chamarAmbulancia = chamarAmbulancia;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public String getAcontecimento() {
        return acontecimento;
    }

    public void setAcontecimento(String acontecimento) {
        this.acontecimento = acontecimento;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
