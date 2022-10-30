class RatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversation_rates"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
