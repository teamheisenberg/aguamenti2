class Input < ActiveRecord::Base
  belongs_to :model

  validates :name, :kind, presence: true
end