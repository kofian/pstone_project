class CreateUsers < ActiveRecord::Migration
  def self.up
  	# create USERS table
	  create_table "users", id: false, force: true do |t|
	    t.integer "id",       limit: 8,  default: 0,  null: false
	    t.string  "username", limit: 30, default: "", null: false
	    t.string  "password", limit: 30, default: "", null: false   
	  end
	  execute "ALTER TABLE users ADD PRIMARY KEY (id);"
	  add_index "users", ["username", "id"], name: "BY_USERNAME", using: :btree
  end

  def self.down
  	drop_table :users
  end
end
