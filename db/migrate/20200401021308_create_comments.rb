class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.user_id :integer
      t.post_id :integer
      t.comment :string

      t.timestamps
    end
  end
end
