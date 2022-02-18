class RefChkProgress < ActiveHash::Base
  include ActiveHash::Enum

  self.data = [
    { id: 0, title: '', progress: 'null' },
    { id: 1, title: '候補者基本情報登録ずみ', progress: 'base_info_recorded' },
    { id: 2, title: '下書き／質問テンプレート設定ずみ', progress: 'draft' },
    { id: 3, title: 'メール送信ずみ', progress: 'mail_sended' },
    { id: 4, title: 'メール開封', progress: 'mail_opened' },
    { id: 5, title: '推薦者登録ずみ', progress: 'recommender_registered' },
    { id: 6, title: '推薦者一部回答', progress: 'answered' },
    { id: 7, title: '推薦者回答ずみ', progress: 'all_answered' },
    { id: 8, title: '完了', progress: 'finished' }
  ]

  enum_accessor :progress
end