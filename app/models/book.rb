class Book < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :profile_image

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}
end
#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる
#presence trueは空欄の場合を意味する