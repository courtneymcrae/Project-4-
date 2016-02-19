class Bucketlist < ActiveRecord::Base
  belongs_to :user
  has_many :photos, dependent: :destroy
  
  validates :to_do, presence: true, length: {maximum: 50}
  validates :date, presence: true 
  validates :summary, presence: true, length: {maximum: 500}
  accepts_nested_attributes_for :photos 
end
