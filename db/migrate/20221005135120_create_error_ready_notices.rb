class CreateErrorReadyNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :error_ready_notices do |t|
      t.references :error_ready_problem, null: false, foreign_key: true
      t.json :backtrace
      t.json :context

      t.timestamps
    end
  end
end
