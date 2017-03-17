$(document).ready ->
  $('a.qty-btn-plus').on 'click', (e) ->
    item = $(this).closest('.js-counter').find('.item-quantity')
    item.val(1 * item.val() + 1)
    $(this).parent('.js-counter').find('.qty-btn-min.disabled').removeClass('disabled')
    e.preventDefault()
    return

  $('a.qty-btn-min').on 'click', (e) ->
    item = $(this).closest('.js-counter').find('.item-quantity')
    item.val(1 * item.val() - 1)
    if `item.val() == 0` or item.val() <= 0
      item.val 0
      $(this).addClass 'disabled'
    e.preventDefault()
    return

  $('.js-counter').each ->
    if `$(this).find('.item-quantity').val() == '0'`
      $(this).find('.qty-btn-min').addClass 'disabled'
    return