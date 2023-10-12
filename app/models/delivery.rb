# == Schema Information
#
# Table name: deliveries
#
#  id                    :integer          not null, primary key
#  description           :string
#  details               :text
#  supposed_to_arrive_on :date
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  delivery_id           :integer
#  user_id               :integer
#
class Delivery < ApplicationRecord
end
