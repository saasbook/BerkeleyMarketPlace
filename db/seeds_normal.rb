# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env !=  "production"
    DatabaseCleaner.clean_with(:truncation)
end

def generate_user_posts user
    
    item_posts = [
        {
            title: "iClicker Model 2 for sale", category: "item", subcategory: "electronics", price: 15,
            available: true, release_time: random_past_time, image: get_image("iclicker.jpg")
        },
        {
            title: "Calculus Solution Manual", category: "item", subcategory: "book", price: 20,
            available: true, release_time: random_past_time, image: get_image("calculus.jpg")
        },
        {
            title: "Linear Algebra Solution Manual", category: "item", subcategory: "book", price: 20,
            available: true, release_time: random_past_time, image: get_image("linear.jpg")
        },
        {
            title: "Old guitar, used for 3 years", category: "item", subcategory: "music related", price: 100,
            available: true, release_time: random_past_time, image: get_image("guitar.jpg")
        },
        {
            title: "XBOX with 20 games bundle, just $233.3", category: "item", subcategory: "electronics", price: 233,
            available: true, release_time: random_past_time, image: get_image("xbox.jpg")
        },
        {
            title: "PS4 with 2 games bundle, just $200", category: "item", subcategory: "electronics", price: 200,
            available: true, release_time: random_past_time, image: get_image("ps4.jpg")
        },
        {
            title: "Used Tesla Model 2, no accidents at all", category: "item", subcategory: "electronics", price: 30000,
            available: true, release_time: random_past_time, image: get_image("tesla.jpg")
        },
        {
            title: "Used king bed, IKEA NO.1 best seller", category: "item", subcategory: "furniture", price: 250,
            available: true, release_time: random_past_time, image: get_image("kingbed.jpg")
        },
    ]

    job_posts = [
        {
            title: "1 machine learning expert needed", category: "job", subcategory: "computer science", price: 100,
            available: true, release_time: random_past_time, image: get_image("kingbed.jpg")
        },
        {
            title: "2 workers for house-moving, $30/hour", category: "job", subcategory: "daily life", price: 30,
            available: true, release_time: random_past_time, image: get_image("house_moving.jpg")
        },
        {
            title: "Short-term Math tutor", category: "job", subcategory: "math", price: 20,
            available: false, release_time: random_past_time, image: get_image("math_tutor.jpg")
        },
        {
            title: "1 pianoist for performance", category: "job", subcategory: "performance", price: 200,
            available: true, release_time: random_past_time, image: get_image("pianoist.jpg")
        },
        {
            title: "Help me have chicken dinner in PUBG for 1 times! Highly rewarded!!", category: "job", subcategory: "daily life", price: 20,
            available: true, release_time: random_past_time, image: get_image("chicken.jpg")
        },
        {
            title: "Beg 2 workers to clean the bathroom for $55/h", category: "job", subcategory: "daily life", price: 55,
            available: true, release_time: random_past_time, image: get_image("clean_bathroom.jpg")
        },
        {
            title: "Taking notes for CS188 and CS189 for 1 year", category: "job", subcategory: "computer science", price: 30,
            available: true, release_time: random_past_time, image: get_image("take_notes.jpg")
        },
        
    ]
    
    event_posts = [
        {
            title: "2 SF Concert tickets", category: "event", subcategory: "performance", price: 200,
            available: true, release_time: random_past_time, image: get_image("sf_concert.jpg")
        },
        {
            title: "1 Berkeley VS Stanford ticket", category: "event", subcategory: "sports", price: 15,
            available: true, release_time: random_past_time, image: get_image("berkeley_stanford.jpg")
        },
        {
            title: "1 hour Farewell speech in Sproul", category: "event", subcategory: "speech", price: 8,
            available: false, release_time: random_past_time, image: get_image("farewell_speech.jpg")
        },
        {
            title: "Private dinner with Google executive board", category: "event", subcategory: "info session", price: 0,
            available: true, release_time: random_past_time, image: get_image("google_dinner.jpg")
        },
        {
            title: "Undergraduate Economics Association Excel Workshop", category: "event", subcategory: "info session", price: 0,
            available: true, release_time: random_past_time, image: get_image("uea_event.jpg")
        },
        {
            title: "Make Berkeley Great Again, public speech in People's Park", category: "event", subcategory: "speech", price: 0,
            available: true, release_time: random_past_time, image: get_image("trump.jpg")
        },
        {
            title: "Date me on Valentine's day 20 years later, 200/h rate" % user.id, category: "event", subcategory: "daily life", price: 200,
            available: true, release_time: random_past_time, image: get_image("doge.jpg")
        },
    ]
    
    posts = (item_posts + event_posts + job_posts)
    
    for post_info in posts do
        post_info[:author_id] = user.id
        post_info[:price] += user.id * 0.1
        post_info[:description] = 20.sentences.join(" ")
        Post.create!(post_info)
    end
    
end

def generate_seed_user uid
    user_info = { uid: uid, email: "test_user@berkeley.edu", name: "Seed User%d" % uid  }
    User.create!(user_info)
end

# create default admin
def generate_admin 
    superusers = [
    "yezhaoqin@berkeley.edu",
    "hyy@berkeley.edu",
    "yqteng@berkeley.edu",
    "shuyindeng@berkeley.edu",
    "yaoge@berkeley.edu",
    "jiazhen.chen@berkeley.edu",
    "foo@berkeley.edu",
    "estherouyang@berkeley.edu",
    "yehaolan@berkeley.edu"
    ] 
    
    superusers.each do |email, uid|
      User.create!( email: email, admin:true)
    end
end

def random_past_time
    rand(5).day.ago - rand(24).hour
end

def future_time
    Time.now + 2000.days
end

def get_image img
    File.open(File.join(Rails.root, "db/support/normal/#{img}"))
end


if Rails.env != "production"
    uid_list = [1]
else
    uid_list = 1..5
end
    
for uid in uid_list do
    user = generate_seed_user uid
    generate_user_posts user
end

generate_admin

# user = generate_admin
# generate_user_posts user
    
# add a user that uploaded nothing, with id 
empty_user = { email: "empty@berkeley.edu", name: "empty user" }
User.create!(empty_user)