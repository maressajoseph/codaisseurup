Theme.destroy_all
User.destroy_all
Event.destroy_all
Registration.destroy_all
Photo.destroy_all

party = Theme.create(name: "Party")
conference = Theme.create(name: "Conference")
meeting = Theme.create(name: "Meeting")
drinks = Theme.create(name: "Drinks")
activity = Theme.create(name: "Activity")
dinner = Theme.create(name: "Dinner")
lunch = Theme.create(name: "Lunch")
breakfast = Theme.create(name: "Breakfast")

maressa = User.create(email: "maressa@codaisseurup.com", password: "abcd1234")
maressa1 = User.create(email: "maressa1@codaisseurup.com", password: "abcd1234")
maressa2 = User.create(email: "maressa2@codaisseurup.com", password: "abcd1234")

photo1 = Photo.create(remote_image_url: "http://res.cloudinary.com/maressajoseph/image/upload/v1496054207/drinks-1200x520_cygtte.jpg")
photo2 = Photo.create(remote_image_url: "http://res.cloudinary.com/maressajoseph/image/upload/v1496057091/breakfast_jitgvg.jpg")
photo3 = Photo.create(remote_image_url: "http://res.cloudinary.com/maressajoseph/image/upload/v1496058181/WalkForLunch_uyjfpq.jpg")

event1 = Event.create(name: "VriMiBo", description: "Friday afternoon drinks", location: "TQ", price: 0.0,
capacity: 50, includes_food: false, includes_drinks: true, starts_at: DateTime.now,
ends_at: DateTime.now, active: true, user: maressa, themes: [drinks, party], photos: [photo1])

event2 = Event.create(name: "Breakfast Meeting", description: "Breakfast Meeting", location: "TQ", price: 5.0,
capacity: 6, includes_food: true, includes_drinks: true, starts_at: DateTime.now,
ends_at: DateTime.now, active: true, user: maressa1, themes: [breakfast, meeting], photos: [photo2])

event3 = Event.create(name: "Walk + Lunch", description: "Walk + Lunch", location: "TQ", price: 5,
capacity: 10, includes_food: true, includes_drinks: true, starts_at: DateTime.now,
ends_at: DateTime.now, active: true, user: maressa2, themes: [activity, lunch], photos: [photo3])

Registration.create(event: event1, user: maressa, status: "Going", price: 100, guests_count: 1)
Registration.create(event: event1, user: maressa1, status: "Going", price: 200, guests_count: 2)
