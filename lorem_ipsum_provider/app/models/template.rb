class Template < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end