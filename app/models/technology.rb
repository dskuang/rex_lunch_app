class Technology < ActiveRecord::Base
  scope :of_type, -> (name) { where(name: name) }

  def obtain_data
    JSON.parse(auth_data).symbolize_keys
  end
end
