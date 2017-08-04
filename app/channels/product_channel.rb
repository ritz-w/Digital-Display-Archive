class ProductChannel < ApplicationCable::Channel
  def subscribed
    #stream_from params['product_id']
  end

  def unsubscribed
    #stop_all_streams
  end

  def listen(data)
    stop_all_streams
    stream_for data['product_id']
  end
end
