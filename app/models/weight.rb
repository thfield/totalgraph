class Weight < ActiveRecord::Base
  before_save :compute_values

  belongs_to :user
  default_scope -> { order('created_at ASC') }
  validates :user_id, presence: true
  validates :total, presence: true
  validates :pfat, presence: true

  def compute_values
  	self.fat = total * pfat/100
  	self.lean = total - self.fat
  end
end
