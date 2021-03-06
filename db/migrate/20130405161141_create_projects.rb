class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.references :team

      t.timestamps
    end
    add_index :projects, :team_id
  end
end
