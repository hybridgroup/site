# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100123082112) do

  create_table "activities", :force => true do |t|
    t.string   "message"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "suppressed", :default => false
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "reviewed_by_user_id"
    t.datetime "reviewed_at"
    t.string   "title",               :limit => 500
    t.string   "body",                :limit => 4000
    t.string   "nature",              :limit => 500
    t.string   "name",                :limit => 2048
    t.string   "email",               :limit => 2048
    t.string   "domain",              :limit => 256
    t.string   "url",                 :limit => 2048
    t.string   "referer",             :limit => 2048
    t.string   "application",         :limit => 256
    t.string   "remote_ip",           :limit => 39
    t.string   "user_agent",          :limit => 2048
    t.string   "cookies",             :limit => 2048
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_items", :force => true do |t|
    t.string   "headline",     :limit => 300
    t.string   "body",         :limit => 4096
    t.integer  "user_id"
    t.datetime "display_date"
    t.datetime "expire_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentation_speakers", :force => true do |t|
    t.integer  "speaker_id",      :null => false
    t.integer  "presentation_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentations", :force => true do |t|
    t.datetime "presentation_date_time"
    t.integer  "proposal_id"
    t.string   "place_holder"
    t.string   "room"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description",            :default => ""
  end

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "tshirt_size"
    t.string   "meal_preference"
    t.string   "company_name"
    t.string   "title"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "twitter_account"
  end

  create_table "proposal_comments", :force => true do |t|
    t.integer  "proposal_id"
    t.integer  "left_by_user_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposals", :force => true do |t|
    t.string   "title"
    t.text     "abstract"
    t.string   "target_audience"
    t.integer  "code_weight"
    t.datetime "date_submitted"
    t.boolean  "reviewed"
    t.datetime "date_reviewed"
    t.integer  "reviewed_by_user_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.boolean  "removed",             :default => false
  end

  create_table "speakers", :force => true do |t|
    t.integer  "profile_id"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

  create_table "sponsors", :force => true do |t|
    t.string   "company_name"
    t.string   "sponsor_level"
    t.date     "sponsor_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.text     "blurb"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "last_login_date", :limit => 255
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_token"
    t.boolean  "admin",                          :default => false
    t.integer  "profile_id"
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
