class Customer < ApplicationRecord

  has_many :orders
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #
  def full_name
    family_name + '' + first_name
  end

  #カナ
  def full_name_kana
    family_name_kana + '' + first_name_kana
  end

  #会員ステータスの判定
  def customer_status
    if is_acvive == false
      "退会済会員"
    else
      "現会員"
    end
  end

  #会員ステータスが現会員のみログイン可能
  def active_for_authentication?
    super && (is_active == true)
  end
  
end
