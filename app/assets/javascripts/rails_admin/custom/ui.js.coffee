#= require select2
$(document).on 'rails_admin.dom_ready', ->
  $('.product-size-chart').select2
    theme: "bootstrap"
return