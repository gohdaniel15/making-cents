class ConsultantSession < ApplicationRecord
  belongs_to :user
  belongs_to :consultant
end
