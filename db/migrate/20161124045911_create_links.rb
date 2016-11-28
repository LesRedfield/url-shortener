class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :long_url, null: false
      t.string :short_url

      t.timestamps
    end
  end
end
