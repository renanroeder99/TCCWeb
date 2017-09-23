$(function(){

    $("#usuario-cep").on("focusout", function (e) {
        if($(this).val().length > 0) {
            $cep = $(this).val();
            $posicao = $cep.indexOf(89);
            if ($posicao != 0) {
                alert("CEP inválido");
                $(this).val("");
                $(this).focus();
            }
        }
    });

});