class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :likes
  validates_presence_of :contents, :message => " is required."

end
