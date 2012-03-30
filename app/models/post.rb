class Post
  include Mongoid::Document
  include Mongoid::Paperclip

  before_save :set_time
  field :content, :type => String
  field :title, :type => String
  field :created_at, :type => Time

  has_mongoid_attached_file :image,
    :storage => :s3,
    :bucket => "sidblog",
    :styles => {:normal => "250x250"},
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => ":attachment/:id/:style.:extension"
  
  belongs_to :user
  attr_accessible :content, :title, :image
 
  def to_s
    title
  end
  
  
  def self.recent_entries
    Post.all.to_a
  end

  private
    
    def set_time
      self.created_at = Time.now
    end

end
