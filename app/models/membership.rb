# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  member_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Membership < ApplicationRecord
  
# From first draft
  # Direct Associations
  belongs_to :member, :class_name => "User"
  belongs_to :group
  
end
