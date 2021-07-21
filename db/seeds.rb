# User.create(username: "guardian123", password: "123456")

5.times do 
    User.create(username: Faker::Name.name, password: "123456")
end
puts "Seeding users..."

Guardian.create(user_id: 1, class_name: "Hunter", power: 1320)
Guardian.create(user_id: 1, class_name: "Warlock", power: 1312)


Item.create(guardian_id: 1, name: "Salvager's Salvo", rarity: "Legendary", weapon_type: "Grenade Launcher", slot: "Secondary", power: 1318, ammo_type: "Energy", is_armor?: false, is_weapon?: true)

# 30.times do 
#     Item.create 
# end