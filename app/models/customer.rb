class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_produts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy

  def full_name
    self.first_name + " " + self.last_name
  end

end
