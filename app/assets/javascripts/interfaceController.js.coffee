class InterfaceController
  constructor: () ->
    @validateForms()

  validateForms: () ->
    $.h5Validate.addPatterns({
      url:  /(http:\/\/|https:\/\/){1}.*/
    });
    $('form').h5Validate();

new InterfaceController

