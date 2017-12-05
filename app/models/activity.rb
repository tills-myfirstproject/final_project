# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  name        :string
#  address     :string
#  category_id :integer
#  meet_time   :time
#  proposer_id :integer
#  visual      :string
#  duration    :integer
#  cost_level  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  date        :string
#

class Activity < ApplicationRecord
  
# From first draft
  # Direct Associations
  has_many :invites, :dependent => :destroy
  belongs_to :category
  belongs_to :proposer, :class_name => "User"
  
  # Indirect Associations
  has_many :invitees, :through => :invites, :source => :invitee
  
  
end
