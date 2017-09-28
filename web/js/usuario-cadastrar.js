$(function () {

    $("#usuario-cep").on("focusout", function (e) {
        if ($(this).val().length > 0) {
            $cep = $(this).val();
            $posicao = $cep.indexOf(89);
            if ($posicao != 0) {
                alert("CEP inválido");
                $(this).val("");
                $(this).focus();
            }
        }
    });

    $("#botao-cadastrar").on("click", function () {
        $email = $("#usuario-email").val();
        $emailConfirmacao = $("#usuario-confirmar-email").val();

        if ($email !== $emailConfirmacao) {
            alert("Confirmação de e-mail não confere");
            return false;
        }
    })


    $("#ocorrencia-policial-cep").on("focusout", function (e) {
        if ($(this).val().length > 0) {
            $cep = $(this).val();
            $posicao = $cep.indexOf(89);
            if ($posicao != 0) {
                alert("CEP inválido");
                $(this).val("");
                $(this).focus();
            }
        }
    });

    function mensagemOcorrenciaEmitida() {
        alert("Ocorrência emitida com sucesso");
    }
});
