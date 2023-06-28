module UsersHelper
    def role
        User.roles.keys.map do |role|
            [t("activerecord.attributes.user.types_role.#{role}"),role]
        end
    end
end