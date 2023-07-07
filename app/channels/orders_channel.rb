class OrdersChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'orders_channel'
    #transmit(Order.all)
  end

  def unsubscribed
    # Desconexión del canal
  end

  def received(data)
    # Lógica para procesar los mensajes recibidos en el canal
  end
end
