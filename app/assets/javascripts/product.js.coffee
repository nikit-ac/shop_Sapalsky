$(document).on "turbolinks:load", ->
  active_img = $('#product-big-image > a > .active')

  lightbox.init()

  $('li.tmb').on("click","img", (event) ->
    active_img_id = $( this ).attr('data')
    active_img.removeClass('active')
    active_img = $('#img' + active_img_id).addClass('active')
    )

 #price range
  value = () ->
    $('.tooltip-inner').text().split(' : ')

  slider = $('#sl2').slider().on('slideStop', (ev) ->
    $.ajax '/products/range' ,
      type: "GET",
      data:
        prices: JSON.stringify(value())
      asnyc: false,
      success: (doc)->
        from = doc.indexOf("<div class='row' id='products'>")
        to = doc.indexOf("</div><!--id='products'-->")
        div = doc.substring(from, to)
        console.log(div)
        $('.features_items').html(div)
    )

  RGBChange = ->
    $('#RGB').css('background', 'rgb('+r.getValue()+','+g.getValue()+','+b.getValue()+')')

