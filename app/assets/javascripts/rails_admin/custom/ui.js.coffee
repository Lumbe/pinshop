#= require select2
#= require ckeditor/init
$(document).on 'rails_admin.dom_ready', ->
  CKEDITOR_BASEPATH = '/ckeditor/'
  $('.product-size-chart').select2
    theme: "bootstrap"
  $('.product-genders').select2
    theme: "bootstrap"
return