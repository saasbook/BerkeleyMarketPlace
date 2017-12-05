FactoryBot.define do
  factory :item, class: Post do
    title 'sample item title'
    price 233
    description 'sample item description'
    category 'item'
    subcategory 'book'
    author_id 1
    available true
    release_time Time.now
    image Rack::Test::UploadedFile.new('spec/controllers/images/doge.png', 'image/png')
  end
  
  factory :sold_item, class: Post do
    title 'sold item title'
    price 233
    description 'sold item description'
    category 'item'
    subcategory 'book'
    author_id 1
    available false
    release_time Time.now
    image Rack::Test::UploadedFile.new('spec/controllers/images/doge.png', 'image/png')
  end

  factory :job, class: Post do
    title 'sample job title'
    price 233
    description 'sample job description'
    category 'job'
    subcategory 'tutor'
    author_id 1
    available true
    release_time Time.now
    image Rack::Test::UploadedFile.new('spec/controllers/images/doge.png', 'image/png')
  end
  
  factory :event, class: Post do
    title 'sample event title'
    price 233
    description 'sample event description'
    category 'event'
    subcategory 'performance'
    author_id 1
    available true
    release_time Time.now
    image Rack::Test::UploadedFile.new('spec/controllers/images/doge.png', 'image/png')
  end
end