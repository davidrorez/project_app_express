module ClientsHelper
  def stateClient
    Client.states.keys.map do |state|
      [t("activerecord.attributes.client.types_state.#{state}"),state]
    end
  end
end