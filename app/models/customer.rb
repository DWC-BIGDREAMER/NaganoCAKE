class Customer < ApplicationRecord

  has_many :orders
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy

  validates :family_name,  :family_name,
                           :first_name,
                           :family_name_kana,
                           :first_name_kana,
                           :email,
                           :encrypted_password,
                           :postcode,
                           :address,
                           :telephone_number,
                           presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #
  def full_name
    family_name + ' ' + first_name
  end

  #カナ
  def full_name_kana
    family_name_kana + '' + first_name_kana
  end

  #会員ステータスの判定
  def cus_status
    if is_active == false
      "退会済会員"
    else
      "現会員"
    end
  end

  #会員ステータスが現会員のみログイン可能
  def active_for_authentication?
    super && (is_active == true)
  end

  # これがないと管理者ログインできないってransackに言われた
  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "email", "encrypted_password", "family_name", "family_name_kana", "first_name", "first_name_kana", "id", "is_active", "postcode", "remember_created_at", "reset_password_sent_at", "reset_password_token", "telephone_number", "updated_at"]
  end

end
