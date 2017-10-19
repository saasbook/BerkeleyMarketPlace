# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'time'

if Rails.env != :production
    require 'database_cleaner'
    DatabaseCleaner.clean_with(:truncation)
end

item_posts = [
    {
        title: "iClicker2 for sale", category: "item", subcategory: "electronics", price: 233.3,
        available: true, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "1.jpg"
    },
    {
        title: "Calculus II Solution Manual", category: "item", subcategory: "book", price: 233.3,
        available: true, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "2.jpg"
    },
    {
        title: "Linear Algebra Solution Manual", category: "item", subcategory: "book", price: 233.3,
        available: false, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "3.jpg"
    },
    {
        title: "Old guitar, still works", category: "item", subcategory: "music related", price: 233.3,
        available: true, release_time: Time.now - 4.days, expire_time: Time.now - 2.days,
        description: "some description", img_name: "4.jpg"
    },
    {
        title: "XBOX with 20 games bundle, just $233.3", category: "item", subcategory: "electronics", price: 233.3,
        available: true, release_time: Time.now - 2.days,
        description: "some description", img_name: "5.jpg"
    },
    {
        title: "PS4 with 2 games bundle, just $2333.3", category: "item", subcategory: "electronics", price: 2333.3,
        available: true, release_time: Time.now - 2.days,
        description: "some description", img_name: "6.jpg"
    },
    {
        title: "Used Tesla Model 3, no accidents at all", category: "item", subcategory: "electronics", price: 2333.3,
        available: true, release_time: Time.now - 2.days,
        description: "some description", img_name: "7.jpg"
    },
    {
        title: "Used king bed, IKEA best seller", category: "item", subcategory: "furniture", price: 233.3,
        available: true, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "8.jpg"
    },
]

job_posts = [
    {
        title: "Machine learning expert needed", category: "job", subcategory: "computer science", price: 233.3,
        available: true, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "#"
    },
    {
        title: "People for house-moving, 20$/hour", category: "job", subcategory: "daily life", price: 233.3,
        available: true, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "#"
    },
    {
        title: "Short-term Math tutor", category: "job", subcategory: "math", price: 233.3,
        available: false, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "#"
    },
    {
        title: "Pianoist for performance", category: "job", subcategory: "performance", price: 233.3,
        available: true, release_time: Time.now - 4.days, expire_time: Time.now - 2.days,
        description: "some description", img_name: "#"
    },
    {
        title: "Help me eat chicken in PUBG! Highly rewarded!!", category: "job", subcategory: "daily life", price: 233.3,
        available: true, release_time: Time.now - 4.days,
        description: "some description", img_name: "#"
    },
    {
        title: "Beg someone to clean the bathroom for $233.3/h", category: "job", subcategory: "daily life", price: 233.3,
        available: true, release_time: Time.now - 4.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "#"
    },
    {
        title: "Taking notes for CS188 and CS189", category: "job", subcategory: "computer science", price: 233.3,
        available: true, release_time: Time.now - 4.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "#"
    },
    
]

event_posts = [
    {
        title: "Concert ticket in SF", category: "event", subcategory: "performance", price: 233.3,
        available: true, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "#"
    },
    {
        title: "Berkeley VS Stanford ticket", category: "event", subcategory: "sports", price: 233.3,
        available: true, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "#"
    },
    {
        title: "Asian life matters speech in Sproul", category: "event", subcategory: "speech", price: 233.3,
        available: false, release_time: Time.now - 2.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "#"
    },
    {
        title: "Private dinner with Google executive board", category: "event", subcategory: "info session", price: 233.3,
        available: true, release_time: Time.now - 4.days, expire_time: Time.now - 2.days,
        description: "some description", img_name: "#"
    },
    {
        title: "Berkeley MarketPlace Info Session", category: "event", subcategory: "info session", price: 233.3,
        available: true, release_time: Time.now - 4.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "#"
    },
    {
        title: "Make Berkeley Great Again, public speech in People's Park", category: "event", subcategory: "speech", price: 233.3,
        available: true, release_time: Time.now - 4.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "#"
    },
    {
        title: "Date me on Valentine's day, 233.3/h rate", category: "event", subcategory: "daily life", price: 233.3,
        available: true, release_time: Time.now - 4.days, expire_time: Time.now + 200.days,
        description: "some description", img_name: "#"
    },
]

item_posts.each { |post_info| Post.create!(post_info) }
event_posts.each { |post_info| Post.create!(post_info) }
job_posts.each { |post_info| Post.create!(post_info) }