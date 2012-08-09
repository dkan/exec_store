require 'rest_client'

API_KEY = ENV['key-3r7fs5u43p35kaia8yoirgs6rtoo2kr5']
API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/mailgun.net"

class Order < ActiveRecord::Base    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    attr_accessible :hoodie, :billing_name, :email, :shipping_name, :stripe_token,
    :billing_address1, :billing_address2, :billing_state, :billing_zip, :billing_city, 
    :shipping_address1, :shipping_address2, :shipping_state, :shipping_zip, :shipping_city

    validates_presence_of :billing_name, :billing_address1, :stripe_token,
    :billing_state, :billing_zip, :billing_city, :hoodie
  
    validates :email, presence: true, 
                      format: { with: VALID_EMAIL_REGEX }

    def bill_customer
        begin
            charge = Stripe::Charge.create(
                :amount => 100_00, # amount in cents
                :currency => "usd",
                :card => stripe_token,
                :description => "charge for #{email}"
                )
        rescue
            self.destroy
            return false
        end
        return true
    end
    
    def email_customer
        RestClient.post "https://api:key-3r7fs5u43p35kaia8yoirgs6rtoo2kr5"\
        "@api.mailgun.net/v2/iamexec.com/messages",
        :from => "Exec Order <store@iamexec.com>",
        :to => "#{email}",
        :subject => "Thank you for purchasing a hoodie!",
        :text => "Thanks #{billing_name.split[0]} for ordering a promotional hoodie!\n\nYour customized limited offer hoodie is being carefully crafted by an EXEC. It should arrive in about 6 weeks.\n\nIf you have any questions, please contact us at support@iamexec.com"
    end
end
