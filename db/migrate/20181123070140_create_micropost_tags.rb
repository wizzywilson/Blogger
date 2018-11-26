class CreateMicropostTags < ActiveRecord::Migration[5.2]
  def change
    create_table :micropost_tags do |t|
      t.references :micropost, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
