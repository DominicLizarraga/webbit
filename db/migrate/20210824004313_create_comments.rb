class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :reply
      t.belongs_to :submission, foreign_key: true

      t.timestamps
    end
  end
end
