class ChangeBlogBodyToText < ActiveRecord::Migration[5.1]
  def change
    change_column :blogs, :body, :text
  end
end
