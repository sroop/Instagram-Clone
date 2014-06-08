class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :follower, index: true
      t.belongs_to :followed, index: true

      t.timestamps
    end

    add_index :relationships, [:follower_id, :followed_id], :unique => true
  end
end
