class User < ActiveRecord::Base
  has_attached_file :image,
                    :storage => :cloudinary,
                    :cloudinary_credentials => Rails.root.join("config/cloudinary.yml"),
                    :path => ':id/user/:style/:filename',
                    :styles => {
                        :thumb => "200x200#",
                        :medium => "350x350#",
                    },
                    :default_url => "/images/post_default.png"
                      
                      
  validates_attachment :image,
                    content_type: { content_type: /\Aimage\/.*\z/ },
                    size: { less_than: 1.megabyte }  
  
  @@superusers = [
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
  
  def superuser?
    @@superusers.include? email 
  end
  
  def self.superusers
    @@superusers
  end
  
  
  validates_format_of :email, :with => /\A(.*)@berkeley.edu\z/i
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      puts "received user:", auth.info
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
    
end
