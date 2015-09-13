class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_attached_file :profile_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",
                    :storage => :s3,
                    :s3_credentials => {:bucket => "levelfly-bmcc.s3.amazonaws.com", :access_key_id => "AKIAJ5AMKYJPDV67MMEQ", :secret_access_key => "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"}
                    # :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  
  validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/

   def s3_credentials
     {:bucket => "levelfly-bmcc.s3.amazonaws.com", :access_key_id => "AKIAJ5AMKYJPDV67MMEQ", :secret_access_key => "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"}
   end
end

# class User
#   has_attached_file :download,
#                     :storage => :s3,
#                     :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

#   def s3_credentials
#     {:bucket => "xxx", :access_key_id => "xxx", :secret_access_key => "xxx"}
#   end
# end

