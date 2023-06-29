module DishesHelper
    def stateDish
        Dish.states.keys.map do |state|
            [t("activerecord.attributes.dish.types_state.#{state}"),state]
        end
    end
end