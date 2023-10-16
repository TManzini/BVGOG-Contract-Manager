# frozen_string_literal: true

class Vendor < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }

  has_many :vendor_reviews, class_name: 'VendorReview'
  has_many :contracts, class_name: 'Contract'

  attr_accessor :old_name

  def get_name
    @old_name = name.to_s if name.present?
    @old_name
  end
end
