class Post < ApplicationRecord


  belongs_to :company
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

end

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#  user_id    :integer
#
