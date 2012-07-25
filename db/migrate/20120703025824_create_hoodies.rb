class CreateHoodies < ActiveRecord::Migration
    def change
        create_table :hoodies do |t|
            t.string :color1
            t.string :color2
            t.string :size
            
            t.timestamps
        end
    end
end
