$(document).ready(function(){
   jQuery("#signupform").validate({
    rules: {
        name: {
            required: true,
            minlength: 3
        },
        email: {
            required: true,
            email: true
        }
    },
    messages: {
        name: "Please enter a valid name.",
        email: "Please enter a valid e-mail."
    }
});
});