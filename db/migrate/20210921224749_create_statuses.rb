class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.references :user, foreign_key: true
      t.date :select_date, presence: true
      t.text  :tasks, presence: true
      t.string :prlinks, presence: true
      t.string :hours, presence: true
      t.timestamps
    end
  end
end
