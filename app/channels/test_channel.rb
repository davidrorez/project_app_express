class TestChannel < ApplicationCable::Channel
  def subscribed
     stream_from "TestChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end