class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.integer :activity_id
      t.integer :invitee_id
      t.string :attend_status

      t.timestamps

    end
  end
end
