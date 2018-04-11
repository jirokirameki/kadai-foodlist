class Restaurant < ApplicationRecord
  # mount_uploader :image, ImageUploader
  before_save { self.email.downcase! }
  
  validates :brand_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :company_name, presence: true, length: { maximum: 50 }
  # validates :url, presence: true, length: { maximum: 255 }, format: /\A#{URI::regexp(%w(http https))}\z/
  
  has_secure_password
  
  has_many :posts
end