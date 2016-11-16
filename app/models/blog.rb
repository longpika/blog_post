class Blog < ActiveRecord::Base
  belongs_to :account
  has_many :comments, as: :commentable, dependent: :destroy
end
