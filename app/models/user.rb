class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessor :image_file_name, :image_content_type, :image_file_size, :image_updated_at

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_attached_file :profile_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",
                    :storage => :s3,
                    :s3_credentials => {:bucket => Rails.application.secrets.s3_bucket_name, :access_key_id => Rails.application.secrets.s3_access_key, :secret_access_key => Rails.application.secrets.s3_secret_key}
                    # :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  
  validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/

  # def s3_credentials
  #   {:bucket => "xxx", :access_key_id => "xxx", :secret_access_key => "xxx"}
  # end
end
