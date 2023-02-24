class User < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 8, maximum: 255 }
  validates :level, presence: true, inclusion: { in: UserLevel.list }

  # Add associations here
  has_one :redirect_user, class_name: "User", foreign_key: "redirect_user_id"
  has_many :contracts, class_name: "Contract", foreign_key: "point_of_contact_id"
  has_many :vendor_reviews, class_name: "VendorReview", foreign_key: "user_id"

  def full_name
    "#{first_name} #{last_name}"
  end
end
