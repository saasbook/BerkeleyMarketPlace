namespace :seed do
  
  desc "seed in the normal way"
  task normal: :environment do
    require(File.join(Rails.root, "db/seeds_normal.rb"))
  end

  desc "seed in the funny way"
  task funny: :environment do
    require(File.join(Rails.root, "db/seeds_funny.rb"))
  end

end
