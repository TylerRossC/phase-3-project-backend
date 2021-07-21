class CreateItems < ActiveRecord::Migration[5.2]
    def change
        create_table :items do |t|
            t.integer :guardian_id
            t.string :name
            t.string :rarity
            t.string :weapon_type 
            t.string :slot
            t.integer :power
            t.string :ammo_type
            t.boolean :is_armor?
            t.boolean :is_weapon?
        end
    end
end