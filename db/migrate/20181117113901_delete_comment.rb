class DeleteComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :deleted, :boolean, default: false
  end
end
