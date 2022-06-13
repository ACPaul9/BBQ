class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  with_options if: -> { user.present? } do
    validates :user, uniqueness: { scope: :event_id }
    validate :avoid_subscription_to_own_event
  end

  # Проверки user_name и user_email выполняются,
  # только если user не задан
  # То есть для анонимных пользователей
  with_options unless: -> { user.present? } do
    validates :user_name, presence: true
    validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/,
              uniqueness: { scope: :event_id }
    validate :user_already_exists
  end

  # Обязательно должно быть событие
  validates :event, presence: true

  # Если есть юзер, выдаем его имя,
  # если нет – дергаем исходный метод
  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  # Если есть юзер, выдаем его email,
  # если нет – дергаем исходный метод
  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def avoid_subscription_to_own_event
    errors.add(:user_email, :own_event) if user == event.user
  end

  def user_already_exists
    errors.add(:user_email, :can_not_use) if User.where(email: user_email).present?
  end
end
