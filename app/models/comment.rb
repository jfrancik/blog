class Comment < ActiveRecord::Base
  attr_accessible :body, :post_id, :sent_by
  belongs_to :post
end
