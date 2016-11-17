class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :blogs, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  def self.mockup_data
    if Account.all.count == 0
      account = Account.new(email: "longpv710@gmail.com", password: "password")
      list_id = [account.id]
    else
      list_id = Account.all.pluck(:id)
    end
    list_size = list_id.length
    for i in 1..50 do
      random = rand(0 .. list_size-1)
      blog = Blog.create(title: "#{i}", content: "Content #{i}", account_id: list_id[random])
      for j in 1..10 do
        random = rand(0 .. list_size-1)
        Comment.create(account_id: list_id[random], commentable_type: 'Blog', commentable_id: blog.id, content: "comment #{j} about blog #{i}")
      end
    end
  end
end
