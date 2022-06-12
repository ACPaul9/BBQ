class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user

  # Проверки user_name и user_email выполняются,
  # только если user не задан
  # То есть для анонимных пользователей
  with_options if: -> { user.present? } do
    validates :user, uniqueness: { scope: :event_id }
  end

  with_options unless: -> { user.present? } do
    validates :user_name, presence: true
    validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/,
              uniqueness: { scope: :event_id }
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
end
