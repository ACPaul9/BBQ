class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Юзер может создавать много событий
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  before_validation :set_name, on: :create
  after_commit :link_subscriptions, on: :create
  # Добавим заодно валидации для юзера
  # Имя не не более 35 символов
  validates :name, presence: true, length: {maximum: 35}

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_fill: [100, 100]
  end

  private

  def set_name
    self.name = "User-№#{rand(777)}" if self.name.blank?
  end

  def link_subscriptions
    puts "#{self.email}"
    Subscription.where(user_id: nil, user_email: self.email)
                .update_all(user_id: self.id)
  end
end
