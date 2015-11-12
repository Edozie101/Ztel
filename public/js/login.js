$(function () {

  $("input,textarea").jqBootstrapValidation({
      preventSubmit: true,
      submitError: function($form, event, errors) {
          // additional error messages or events
      },
      submitSuccess: function($form, event) {
          event.preventDefault(); // prevent default submit behaviour
          // get values from FORM
          var form = $("#loginform");
          var username = $("input#email");
          var password = $("input#password");

          $.ajax({
            url: form.attr('action'),
            data: {'user' : username, 'password' : password},
            type: 'POST',
            cache: false,
            success: function () {
              console.log("its working");
            },
            error: function () {
              console.log("its not working");
            }
          })


    },
    filter: function() {
        return $(this).is(":visible");
    },
 })
})
