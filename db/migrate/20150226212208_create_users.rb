class CreateUsers < ActiveRecord::Migration
  def self.up
  	# create USERS table
	  create_table "users", id: false, force: true do |t|
	    t.uuid 	  	"id",       	limit: 8,  null: false, unique: true
	    t.string  	"username", 	limit: 30, default: "", null: false
	    t.string  	"password", 	limit: 30, default: "", null: false   
	    t.string 	"role", 		limit: 30, default: nil
	  end
	  execute "ALTER TABLE users ADD PRIMARY KEY (id);"
	  add_index "users", ["username", "id"], name: "BY_USERNAME", using: :btree
  end

  def self.down
  	drop_table :users
  end
end
