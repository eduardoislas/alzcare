
$(document).ready(function () {
    getAdults();
  
});

function getAdults() {

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
   
    $.ajax({
        type: 'GET',
        dataType: 'json',
        url: '/getAdults_json',
        success: function (data) {
         var items= JSON.parse(data);
          for (var i = 0; i < items.length; i++) {
            adult_items.push(items[i].fields);
            }
            loadGridAdults();

        }
    });

}



var adult_items =[]
function loadGridAdults() {
    $('#adults').DataTable({
        data: adult_items,
        columns: [
            { title: "Nombre", data: "name" },
            { title: "Fase", data: "phase" }
        ],
        order: [[0, "desc"]],
        language: idioma
    });
    $('#adults tbody').on('click', 'tr', function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
            
        }
        else {
            $('#adults').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
}