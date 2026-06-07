class CreateTaskQueues < ActiveRecord::Migration[8.1]
  def change
    create_table :task_queues do |t|
      t.string :name
      t.references :notebook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
