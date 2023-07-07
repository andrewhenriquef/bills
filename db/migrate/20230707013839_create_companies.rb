class CreateCompanies < ActiveRecord::Migration[7.0]
  def up
    create_table :companies do |t|
      t.string :document, null: false, index: { unique: true }
      t.string :name
      t.string :email, null: false, index: { unique: true }

      t.timestamps
    end
  end

  def down
    drop_table :companies
  end
end
