# == Schema Information
#
# Table name: invites
#
#  id            :integer          not null, primary key
#  activity_id   :integer
#  invitee_id    :integer
#  attend_status :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Invite < ApplicationRecord
  
# From first draft
  # Direct Associations
  belongs_to :activity
  belongs_to :invitee, :class_name => "User"
  
end
