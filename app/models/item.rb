class Item < ApplicationRecord
  has_one_attached :image

  has_many :cart_items, dependent: :destroy
  has_many :order_details

  belongs_to :genre

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: [true, false]

  #販売ステータスを日本語で表示
  def sale_status
    if is_active == true
      "販売中"
    else
      "販売停止中"
    end
  end

  #税込価格
  def taxed_price
    (self.price * 1.10).round
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/sato.cake/皿にケーキ.jpg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/*")
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  #ransackに書けって言われた
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "genre_id", "id", "introduction", "is_active", "name", "price", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["cart_items", "genre", "image_attachment", "image_blob", "order_details"]
  end


end

