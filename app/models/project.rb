class Project < ApplicationRecord

	# 驗證 title 及 content 欄位必填
	validates :title, :description, presence: true

	# 如果 Project 已經有了 tasks，就不允許刪除（刪除時拋出 Error）
	has_many :tasks, dependent: :restrict_with_error
	
end
