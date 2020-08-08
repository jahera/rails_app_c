class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string   :email,              null: false, default: ""
      t.string   :first_name,              null: false, default: ""
      t.string   :last_name,               null: false, default: ""
      t.string   :contact_no,              null: false, default: ""
      t.datetime :dob,                     null: false, default: ""
      t.integer :company_id
      t.string  :auth_token

      t.timestamps
    end
  end
end
