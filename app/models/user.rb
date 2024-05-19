class User < ApplicationRecord
  has_many :products
  belongs_to :company
  def current_company
    # Assuming the user is associated with a single company
    self.company
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         attribute :admin, :boolean, default: false
         enum role: { employee: 0, admin: 1, accountant:2 }
end
