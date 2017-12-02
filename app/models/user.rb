# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
# From first draft  
  # Direct Associations
  has_many :activities, :foreign_key => "proposer_id", :dependent => :destroy
  has_many :invites, :foreign_key => "invitee_id", :dependent => :destroy
  has_many :groups, :foreign_key => "creator_id", :dependent => :destroy
  has_many :memberships, :foreign_key => "member_id", :dependent => :destroy
  
  # Indirect Associations
  has_many :activity_invites, :through => :invites, :source => :activity
  has_many :group_memberships, :through => :memberships, :source => :group
  
end
