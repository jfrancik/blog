class Post < ActiveRecord::Base
  attr_accessible :body, :sent_by, :subject
  has_many :comments
end
