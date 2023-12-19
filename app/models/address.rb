class Address < ApplicationRecord
  belongs_to :customer

  validates :name, :address, presence: true
  validates :address, length: { maximum: 50 }
  validates :postcode, format: {with: /\A\d{7}\z/}, presence: true

  def mark_postcode
    "〒" + postcode
  end


end
