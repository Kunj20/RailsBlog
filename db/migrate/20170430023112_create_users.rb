class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :uname
      t.string :password
      t.string :email
      t.string :city
      t.string :occupation

      t.timestamps
    end
  end
end
