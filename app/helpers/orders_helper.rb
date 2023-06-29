module OrdersHelper
  def stateClient
    Order.states.keys.map do |state|
      [t("activerecord.attributes.order.types_state.#{state}"),state]
    end
  end
end