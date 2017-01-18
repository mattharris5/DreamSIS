class Training < ApplicationRecord
  validates_presence_of :title, :video_url
  
  has_many :completions, class_name: "TrainingCompletion"
  
end
