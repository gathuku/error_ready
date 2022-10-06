class CreateErrorReadyProblems < ActiveRecord::Migration[7.0]
  def change
    create_table :error_ready_problems do |t|
      t.text :message
      t.string :err_class
      t.string :environment
      t.string :severity
      t.datetime :first_notice_at
      t.datetime :last_notice_at
      t.integer :notices_count
      t.datetime :resolved_at

      t.timestamps
    end
  end
end
