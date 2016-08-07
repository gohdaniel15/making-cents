class ConsultantSession < ApplicationRecord
  belongs_to :user
  belongs_to :user_consultant, class_name: 'User'
end
