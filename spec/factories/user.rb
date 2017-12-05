FactoryBot.define do
  factory :user, class: User do
    uid "-1"
    name "normal user"
    email "normal@berkeley.edu"
  end

  factory :superuser, class: User do
    uid "-2"
    name "superuser"
    email "foo@berkeley.edu"
  end
end