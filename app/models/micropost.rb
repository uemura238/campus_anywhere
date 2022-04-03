class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :univ, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }

  def self.search(search) # self.はUser.を意味する
    if search
      where(['univ LIKE ?', "%#{search}%"]) # 検索とuseanameの部分一致を表示。
    else
      all # 全て表示させる
    end
  end
end
