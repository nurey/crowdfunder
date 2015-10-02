class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.text :name
      t.text :description
      t.integer :backer_limit
      t.belongs_to :project # => 'project_id'

      t.timestamps null: false
    end
  end
end
