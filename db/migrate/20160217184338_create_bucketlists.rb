class CreateBucketlists < ActiveRecord::Migration
  def change
    create_table :bucketlists do |t|
      t.string :to_do
      t.integer :date
      t.string :summary
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
