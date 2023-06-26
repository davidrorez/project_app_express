class Client < ApplicationRecord
    
    has_many :orders
    
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :physical_address, presence: true
    validates :password, presence: true
    validates :state, presence: true
    enum state: {"enable": 0, "disable": 1}


end
