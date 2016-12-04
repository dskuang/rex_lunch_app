class Email < ActiveRecord::Base
  scope :of_group, -> (group) { where(group_name: group) }

  def self.addresses
    pluck(:address)
  end
end
