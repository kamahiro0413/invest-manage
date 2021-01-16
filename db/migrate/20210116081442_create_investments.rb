class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.date :date ,       null: false
      t.integer :money,    null: false
      t.string :content
      t.integer :category,     null: false
      t.integer :account,  null: false
      t.integer :period
      t.references :user,  foreign_key: true
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
