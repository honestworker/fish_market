class CreateTeamMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :team_members do |t|
      t.string :name
      t.string :job_title
      t.text :summary
      t.attachment :image
      t.integer :order

      t.timestamps
    end
  end
end
