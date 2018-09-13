
function loaderON() {
    $("#lockscreen").fadeIn();
}

function loaderOFF() {
    $("#lockscreen").fadeOut();
}

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

function noSeleccion() {
    swal({
        title: "Por favor seleccione un elemento de la lista.",
        type: 'warning',
        confirmButtonText: 'Aceptar'
    });
}

function validaCamposGlobal(idForm) {

    var campos = document.querySelectorAll('*[id^="vld_"]');
    var rules = {};
    var messages = {};

    for (var i = 0; i < campos.length; i++) {
        rules[campos[i].name] = { required: true };
        messages[campos[i].name] = { required: campoRequerido };
        if (campos[i].dataset.maxlength !== "" && campos[i].dataset.maxlength != undefined && campos[i].dataset.maxlength !== NaN)
            rules[campos[i].name].maxlength = campos[i].dataset.maxlength;
        if (campos[i].dataset.number !== "" && campos[i].dataset.number != undefined && campos[i].dataset.number !== NaN)
            rules[campos[i].name].number = campos[i].dataset.number;
        if (campos[i].dataset.digits !== "" && campos[i].dataset.digits != undefined && campos[i].dataset.digits !== NaN)
            rules[campos[i].name].digits = campos[i].dataset.digits;
        if (campos[i].dataset.formatodate !== "" && campos[i].dataset.formatodate != undefined && campos[i].dataset.formatodate !== NaN)
            rules[campos[i].name].formatodate = campos[i].dataset.formatodate;
    }
    $("#" + idForm).validate({
        ignore: "hidden",
        rules: rules,
        messages: messages,
        errorClass: 'error lbl-validation',
    });
}

function limpiaCamposGlobal() {
    var campos = document.querySelectorAll('*[id^="vld_"]');
    for (var i = 0; i < campos.length; i++) {
        campos[i].value = "";
    }
}