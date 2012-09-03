# Defines a program with which a person can be affiliated.
class Program < ActiveRecord::Base
  validates_presence_of :title, :abbreviation
  
  has_and_belongs_to_many :people
  
  default_scope :order => "title"
end