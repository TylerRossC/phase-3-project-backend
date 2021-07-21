class CreateGuardians < ActiveRecord::Migration[5.2]
    def change
        create_table :guardians do |t|
           t.integer :user_id
           t.string :class_name
           t.integer :power
        end
    end
end