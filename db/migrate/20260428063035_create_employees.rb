class CreateEmployees < ActiveRecord::Migration[7.2]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :job_title
      t.string :country
      t.decimal :salary, precision: 12, scale: 2
      t.string :email
      t.string :department

      t.timestamps
    end
    add_index :employees, :job_title
    add_index :employees, :country
    add_index :employees, :salary
    add_index :employees, :email
  end
end
