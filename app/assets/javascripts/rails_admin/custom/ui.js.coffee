#= require select2
CKEDITOR_BASEPATH = '/ckeditor/'
#= require ckeditor/init
$(document).on 'rails_admin.dom_ready', ->
  $('.product-size-chart').select2
    theme: "bootstrap"
  $('.product-genders').select2
    theme: "bootstrap"
return