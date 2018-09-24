
$(document).ready(function () {
  
  
});

var answers = [];

function searchAnswer(element){

    var here = false;
     for (var i = 0; i < answers.length; i++) {
            if(answers[i].question == element.name){
               here = true;
            }
        }
return  here;
}


function modifyListAnswer(element){
        for (var i = 0; i < answers.length; i++) {
            if(answers[i].question == element.name){
               answers[i].option = element.value;
            }
        }

}

function addAnswer(element){
    
    if(answers.length > 0){  
       if(searchAnswer(element)){
        modifyListAnswer(element);
       }else{ 
        var answer = new Object();
        answer.question = element.name;
        answer.option = element.value;
        answers.push(answer);
       }
    }else{
        var answer = new Object();
        answer.question = element.name;
        answer.option = element.value;
        answers.push(answer);
    }

}



function sendAnswers() {

    loaderON();
    $.ajaxSetup({ 
        beforeSend: function(xhr, settings) {
            function getCookie(name) {
                var cookieValue = null;
                if (document.cookie && document.cookie != '') {
                    var cookies = document.cookie.split(';');
                    for (var i = 0; i < cookies.length; i++) {
                        var cookie = jQuery.trim(cookies[i]);
                        // Does this cookie string begin with the name we want?
                        if (cookie.substring(0, name.length + 1) == (name + '=')) {
                            cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                            break;
                        }
                    }
                }
                return cookieValue;
            }
            if (!(/^http:.*/.test(settings.url) || /^https:.*/.test(settings.url))) {
                // Only send the token to relative URLs i.e. locally.
                xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));
            }
        } 
   });

  var res = JSON.stringify(answers)
    $.ajax({
        type: 'POST',
        dataType: 'json',
        url: '/results',
        data: { result_list: res },
        success: function (data) {
            if(data.success){
                loaderOFF();

                swal({
                    title: "!Listo!",
                    text: data.mensaje,
                    icon: "success",
                    button: "Aceptar",
                    
                }).then(function () {
                    var protocolo = window.location.protocol;
                    var host = window.location.host;
                    window.location.href = protocolo + "//" + host + "/home/";
                });
            }
        }
    });
}
var damian ;