App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    console.log("connected")
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log("received")
    // Called when there's incoming data on the websocket for this channel
    $(".alert.alert-info").show();
    console.log("shown")
    $(".product-reviews").prepend(data.comment);
    $("#average-rating").attr('data-score', data.average_rating);
    refreshRating();
    console.log(data)
  },

  listen_to_comments: function() {
    console.log("listening")
    return this.perform('listen', {
      product_id: $("[data-product-id]").data("product-id")

    });
  }
})

$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();
});