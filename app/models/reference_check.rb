class ReferenceCheck < ApplicationRecord
  belongs_to :candidate
  belongs_to :user

  has_many :recommender_settings, dependent: :destroy

  enum :progress, {
    base_info_recorded: 1,        # 候補者登録
    question_template_setted: 2,  # 質問テンプレート設定／下書き
    mail_sended: 3,
    mail_opened: 4,               # メール開封／推薦者未登録
    recommender_registered: 5,
    recommender_answered: 6,
    all_recommender_answered: 7,
    finished: 8
  }
end
