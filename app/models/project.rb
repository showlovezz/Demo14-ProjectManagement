class Project < ApplicationRecord

	# 驗證 title 及 content 欄位必填
	validates :title, :description, presence: true

	has_many :tasks
	
end
