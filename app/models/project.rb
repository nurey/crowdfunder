class Project < ActiveRecord::Base
  has_many :rewards
  belongs_to :user

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true
end
