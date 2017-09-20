

# 100.times do

#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name

#   contact = Contact.new(
#                                       first_name: first_name,
#                                       last_name: last_name,
#                                       email: Faker::Internet.free_email("#{first_name}.#{last_name}"),
#                                       phone_number: Faker::PhoneNumber.phone_number
#                                       )

#   contact.save

# end

Group.create!(name: "Friends")
Group.create!(name: "Family")
Group.create!(name: "Business")
Group.create!(name: "New York")
Group.create!(name: "San Francisco")
Group.create!(name: "Chicago")
Group.create!(name: "Speed Dial")


Contact.all.each do |contact|
    group_ids = Group.pluck(:id)
    group_1 = group_ids.shuffle.pop
    group_2 = group_ids.shuffle.pop

    GroupContact.create!(contact_id: contact.id, group_id: group_1)
    GroupContact.create!(contact_id: contact.id, group_id: group_2)
end



