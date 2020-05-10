class Question
  include Mongoid::Document
  field :question, type: String
  field :answer, type: String
  field :responses, type: Array
  field :category, type: Array
  field :createdBy, type: Reference

  validates :question, :answer, :responses, presence: true
  belongs_to :user 
end
