# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'time'

if Rails.env !=  "production"
    require 'database_cleaner'
    DatabaseCleaner.clean_with(:truncation)
end

def generate_user_posts user
    
    item_posts = [
        {
            title: "iClicker%d for sale" % user[:id], category: "item", subcategory: "electronics", price: 233.3,
            available: true, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        },
        {
            title: "Calculus %d Solution Manual" % user[:id], category: "item", subcategory: "book", price: 233.3,
            available: true, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        },
        {
            title: "Linear Algebra  %d Solution Manual" % user[:id], category: "item", subcategory: "book", price: 233.3,
            available: false, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        },
        {
            title: "Old guitar, still works for %d years" % user[:id], category: "item", subcategory: "music related", price: 233.3,
            available: true, release_time: Time.now - 4.days, expire_time: Time.now - 2.days,
        },
        {
            title: "XBOX %d with 20 games bundle, just $233.3" % user[:id], category: "item", subcategory: "electronics", price: 233.3,
            available: true, release_time: Time.now - 2.days,
        },
        {
            title: "PS%d with 2 games bundle, just $2333.3" % user[:id], category: "item", subcategory: "electronics", price: 2333.3,
            available: true, release_time: Time.now - 2.days,
        },
        {
            title: "Used Tesla Model %d, no accidents at all" % user[:id], category: "item", subcategory: "electronics", price: 2333.3,
            available: true, release_time: Time.now - 2.days,
        },
        {
            title: "Used king bed, IKEA NO.%d worst seller" % user[:id], category: "item", subcategory: "furniture", price: 233.3,
            available: true, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        },
    ]

    job_posts = [
        {
            title: "%d machine learning expert needed" % user[:id], category: "job", subcategory: "computer science", price: 233.3,
            available: true, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        },
        {
            title: "%d people for house-moving, 20$/hour" % user[:id], category: "job", subcategory: "daily life", price: 233.3,
            available: true, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        },
        {
            title: "Short-term %d Math tutor" % user[:id], category: "job", subcategory: "math", price: 233.3,
            available: false, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        },
        {
            title: "%d pianoist for performance" % user[:id], category: "job", subcategory: "performance", price: 233.3,
            available: true, release_time: Time.now - 4.days, expire_time: Time.now - 2.days,
        },
        {
            title: "Help me eat chicken in PUBG for %d time! Highly rewarded!!" % user[:id], category: "job", subcategory: "daily life", price: 233.3,
            available: true, release_time: Time.now - 4.days,
        },
        {
            title: "Beg someone to clean the bathroom for $233.3/%dh" % user[:id], category: "job", subcategory: "daily life", price: 233.3,
            available: true, release_time: Time.now - 4.days, expire_time: Time.now + 200.days,
        },
        {
            title: "Taking notes for CS188 and CS189 for %d years" % user[:id], category: "job", subcategory: "computer science", price: 233.3,
            available: true, release_time: Time.now - 4.days, expire_time: Time.now + 200.days,
        },
        
    ]
    
    event_posts = [
        {
            title: "%d Concert ticket in SF" % user[:id], category: "event", subcategory: "performance", price: 233.3,
            available: true, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        },
        {
            title: "%d Berkeley VS Stanford ticket" % user[:id], category: "event", subcategory: "sports", price: 233.3,
            available: true, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        },
        {
            title: "%d hour Asian life matters speech in Sproul" % user[:id], category: "event", subcategory: "speech", price: 233.3,
            available: false, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        },
        {
            title: "Private dinner with %d Google executive board" % user[:id], category: "event", subcategory: "info session", price: 233.3,
            available: true, release_time: Time.now - 4.days, expire_time: Time.now - 2.days,
        },
        {
            title: "Berkeley MarketPlace NO.%d Info Session" % user[:id], category: "event", subcategory: "info session", price: 233.3,
            available: true, release_time: Time.now - 4.days, expire_time: Time.now + 200.days,
        },
        {
            title: "Make Berkeley Great For the %d Time, public speech in People's Park" % user[:id], category: "event", subcategory: "speech", price: 233.3,
            available: true, release_time: Time.now - 4.days, expire_time: Time.now + 200.days,
        },
        {
            title: "Date me on Valentine's day %d years later, 233.3/h rate" % user[:id], category: "event", subcategory: "daily life", price: 233.3,
            available: true, release_time: Time.now - 4.days, expire_time: Time.now + 200.days,
        },
    ]
    
    posts = (item_posts + event_posts + job_posts)
    image_path_list = Dir[File.join(Rails.root, "db/support/*")]
    
    for post_info in posts do
        image = File.open(image_path_list.sample)
        post_info[:image] = image
        post_info[:author_id] = user[:id]
        post_info[:description] = (0...2000).map { (('a'..'z').to_a + Array.new(20, " "))[rand(46)] }.join
        Post.create!(post_info)
    end
    
end

def generate_seed_user uid
    user_info = { id: uid, email: "seed-user%d@berkeley.edu" % uid, name: "seed-user %d" % uid  }
    User.create!(user_info)
    return user_info
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
    