class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.date :start_time ,        null: false
      t.integer :money,           null: false
      t.string :content
      t.integer :category_id,     null: false
      t.integer :account_id,      null: false
      t.integer :period_id
      t.references :user,  foreign_key: true
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
