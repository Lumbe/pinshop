$(document).ready ->
  $('input.product-brand').on 'click', ->
    brands = $('input.product-brand').map ->
      result = if $(this).prop('checked') then $(this).val() else null
      result
    $.ajax
      url: "#{category_path(@category)}"
      dataType: 'script'
      data:
        brand: brands