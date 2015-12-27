class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
    create_table :versions do |t|
      Rails.logger.info 2222
      t.belongs_to :versioned, :polymorphic => true
      t.belongs_to :user, :polymorphic => true
      t.string  :user_name
      t.text    :modifications
      t.integer :number
      t.integer :reverted_from
      t.string  :tag

      t.timestamps

      t.index [:versioned_id, :versioned_type]
      t.index [:user_id, :user_type]
      t.index :user_name
      t.index :number
      t.index :tag
      t.index :created_at
    end
  end
end
