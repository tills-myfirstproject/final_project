# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  creator_id :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord
  
# From first draft
  # Direct Associations
  belongs_to :user, :foreign_key => "creator_id"
  has_many :memberships, :dependent => :destroy
  
  #Indirect Associations
  has_many :members, :through => :memberships, :source => :member
  
end
