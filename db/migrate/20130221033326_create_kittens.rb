class CreateKittens < ActiveRecord::Migration
  def change
    create_table :kittens do |t|
      t.timestamp :queued_at
      t.timestamps
    end
  end
end
