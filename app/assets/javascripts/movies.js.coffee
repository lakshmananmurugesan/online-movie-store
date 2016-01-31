$(window).load ->
  $('.remove_from_cart').click (e) ->
    e.preventDefault()
    $this = $(this)
    url = $this.data('targeturl')
    $.ajax url: url, type: 'put', success: (data) ->
      $('.cart-count').html(data)
      $this.closest('.cart-movie').slideUp()

  $('.button.cartbox').click (e) ->
    e.preventDefault()
    $this = $(this).closest('a')
    cart_text = $this.text()

    if $.trim(cart_text) == "Remove from Cart"
      $this.html("<i class=\"fi-shopping-cart\"></i><span> Add to Cart</span>")
      url = $this.data('removeurl')
    else
      url = $this.data('addurl')
      $this.html("<i class=\"fi-shopping-cart\"></i><span> Remove from Cart</span>")

    $.ajax url: url, type: 'put', success: (data) ->
      $('.cart-count').html(data)
      $this.closest('.cart-movie').slideUp()
