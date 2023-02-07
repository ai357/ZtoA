class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable

  enum status: {
    before_leave: 0,
    maternity_leave: 1,
    childcare_leave: 2,
    childcare: 3
  }

  belongs_to :company
  has_many :posts
  has_many :comments
  has_many :documents, dependent: :destroy
  has_many :notifications
  # has_many :schedules, dependent: :destroy

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end
  
  
  
end

# == Schema Information
#
# Table name: employees
#
#  id                     :integer          not null, primary key
#  baby_name              :string
#  birth                  :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  expected               :date
#  is_deleted             :boolean          default(FALSE), not null
#  name                   :string
#  number                 :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sex                    :string
#  status                 :integer          default("before_leave"), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_id             :integer
#
# Indexes
#
#  index_employees_on_email                 (email) UNIQUE
#  index_employees_on_reset_password_token  (reset_password_token) UNIQUE
#
