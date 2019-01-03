$(document).ready ->
  active_img = $('#product-big-image > .active')
  console.log(1)

  $('li.tmb').on("click","img", (event) ->
    active_img_id = $( this ).attr('data')
    active_img.removeClass('active')
    active_img = $('#img' + active_img_id).addClass('active')
    console.log(2)
    )



