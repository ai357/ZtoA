class Post < ApplicationRecord

  #idがnillでも投稿できるようにoptional: trueする
  belongs_to :company, optional: true
  belongs_to :employee, optional: true
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

end

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  body        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer
#  employee_id :integer
#
