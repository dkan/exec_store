class CreateOrders < ActiveRecord::Migration
    def change
        create_table :orders do |t|
            t.string :hoodie
            t.string :billing_name
            t.string :email
            t.string :stripe_token
            
            t.string :billing_address1
            t.string :billing_address2
            t.string :billing_state
            t.string :billing_zip
            t.string :billing_city
            
            t.string :shipping_name
            t.string :shipping_address1
            t.string :shipping_address2
            t.string :shipping_state
            t.string :shipping_zip
            t.string :shipping_city
            
            t.timestamps
        end
    end
end
