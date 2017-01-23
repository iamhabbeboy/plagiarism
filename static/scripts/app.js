
/*
  Developed by Megafuse Technologies
  Megafuse Beans Guyz
 */

(function() {
  window.App = function() {
    return {
      login: function(e) {
        var email, pass;
        email = document.getElementById('email');
        return pass = document.getElementById('pass');
      },
      max_character: function(elem, max_length) {
        // Max character
        var datalist, data;
        datalist = document.getElementsByTagName('span');

        $(elem).keyup(function() {
          if ( $(this).val().length >= max_length) {
            $(this).val($(this).val().substr(0, max_length));
            //console.log($(this).val().length);
            console.log("stop...." + $(this).val().length);
          } else {
            console.log("stop....");
          }
          for( var _x = 0; _x < datalist.length; _x++ ) {
            data = datalist[_x];
            attr = data.getAttribute('data-list');
            //alert(data);
            if ( attr === elem ) {
              _el = document.querySelector(elem).value;
              data.innerHTML = _el.length;
            }
          }
        });
      },
      add_new: function() {

        $('#add-new').click(function() {
          var more, format;
          more = $('#show-more');
          format = "<select name=\"doc_type[]\" class=\"browser-default typer\" id=\"doc\" required data-id='true'>"
          +"<option value=\"0\"> --select --</option>"
          +"<option value=\"introduction\">Introduction </option>"
          +"<option value=\"methodology\">Methodology</option>"
          +"</select>";
          format += "<br><br><textarea class=\"materialize-textarea doc\" name=\"document[]\" data-id='true' id=\"txt\" placeholder=\"Paste Project Write Up\" required></textarea>";
          more.append(format);
        });

        $('#projectSubmit').on('click', function(e){
          e.preventDefault();
          var elem, topic, supervisor, year,
              matric, level, _attr, store = [];
          /**
            Assignment Segment ...
          **/
          topic = document.getElementById('topic');
          supervisor = document.getElementById('supervisor');
          year = document.getElementById('year');
          level = document.getElementById('level');
          matric = document.getElementById('matric');
          elem = document.getElementsByClassName('typer');
          doc_elem = document.getElementsByClassName('doc');


          if( topic.value == '' ) {
            Materialize.toast("Project Topic is required !", 4000);
            topic.focus();
            return false;
          } else if ( supervisor.value == '') {
            Materialize.toast("Project Supervisor name is required !", 4000);
            supervisor.focus();
            return false;
          } else if ( year.value == '' ) {
            Materialize.toast("Project Year is required !", 4000);
            year.focus();
            return false;
          } else if( level.value == '0') {
            Materialize.toast("Student Level is required !", 4000)
            level.focus();
            return false;
          } else if ( matric.value == '' ) {
            Materialize.toast("Student Matric No. is required ", 4000)
            matric.focus();
            return false;
          } else if ( elem[0].value == '0' ) {
            Materialize.toast("Project Write up section is required !", 4000)
            elem[0].focus();
            return false;
          }  else if ( doc_elem[0].value == '' ) {
            Materialize.toast("Project Write up content is required !", 4000)
            doc_elem[0].focus();
            return false;
          } else {

              for(var _key = 0; _key < elem.length; _key++ ) {
                var storage;
                storage = {
                  'topic' : topic.value,
                  'supervisor' : supervisor.value,
                  'year' : supervisor.value,
                  'level': level.value,
                  'matric' : matric.value,
                  'doc_type' : elem[_key].value,
                  'doc' : doc_elem[_key].value
                };
                /*
                  Ajax Request...
                 */
                $.post('/ajax', storage, function(callback) {
                  //alert(callback);
                  if ( callback === 'ok') {
                    Materialize.toast("<i class='fa fa-check'></i> Project Write Added Successfully", 4000)
                    setTimeout(function(){
                        window.location = '/add-new';
                    }, 4000);

                  } else if ( callback === 'exist' ){

                      Materialize.toast("Student Write Up Already Added for Section ", 4000)

                  } else {
                      Materialize.toast("Error Occured ", 4000)
                  }
                });
              }
            }
        });
      }
    };
  };

}).call(this);
