$(document).ready ->
  $(document).ajaxStart ->
    $('.product-list').hide('fade')
  $(document).ajaxStop ->
    $('.product-list').show('fade')
  return