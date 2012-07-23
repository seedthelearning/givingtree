jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  stripe_token.setupForm()

stripe_token =
  setupForm: ->
    $('#update_user_stripe_token').submit ->
      $('#update_token').attr('disabled', true)
      stripe_token.processCard()
      false

  processCard: ->
    card =
      number: $('#credit_card_number').val()
      cvv: $('#cvv_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, stripe_token.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#user_stripe_token').val(response.id)
      $('#update_user_stripe_token').get(0).submit()
    else
      $('#stripe_error').text(response.error.message)
      $('#update_token').attr('disabled', false)
