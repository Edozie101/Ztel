$(function () {

  $("input,textarea").jqBootstrapValidation({
      preventSubmit: true,
      submitError: function($form, event, errors) {
          // additional error messages or events
          console.log("submit Error");
      },
      submitSuccess: function($form, event) {
          event.preventDefault(); // prevent default submit behaviour
          // get values from FORM
          var form = $("#loginform");
          var username = $("input#email").val();
          var password = $("input#password").val();
          console.log("submit submitSuccess");
          console.log(username, password);
          console.log(form);
          $.ajax({
            url: "/login",
            data: {'user' : username,
                  'password' : password},
            type: 'POST',
            cache: false,
            success: function () {
              console.log("its working");
            },
            error: function () {
              console.log("its not working");
            },
          })


    },
    filter: function() {
        return $(this).is(":visible");
    },
 })
})

// $(function () {
//
//
// $("#loginform").submit(
//   function () {
//     this.ajaxSubmit(
//       {url: $('#loginform').attr('action'),
//        type: 'POST',
//        data: {'user':  $("input#email").val(),
//               'password':  $("input#password").val()},
//
//       }
//     )
//   })
//
// })
