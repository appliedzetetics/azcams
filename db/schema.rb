# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131021114454) do

  create_table "absence_slots", :force => true do |t|
    t.integer  "absence_id"
    t.time     "time_from"
    t.time     "time_to"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "absence_slots", ["absence_id"], :name => "index_absence_slots_on_absence_id"
  add_index "absence_slots", ["time_from"], :name => "index_absence_slots_on_time_from"

  create_table "absences", :force => true do |t|
    t.integer  "practitioner_id", :null => false
    t.date     "date_from",       :null => false
    t.date     "date_to",         :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.text     "note"
  end

  add_index "absences", ["date_from"], :name => "index_absences_on_date_from"
  add_index "absences", ["practitioner_id"], :name => "index_absences_on_practitioner_id"

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "logo"
    t.string   "bgcolor"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.boolean  "file_no_per_episode"
  end

  add_index "accounts", ["user_id"], :name => "index_accounts_on_user_id"

  create_table "accounts_settings", :id => false, :force => true do |t|
    t.integer "account_id", :null => false
    t.integer "setting_id", :null => false
    t.string  "value"
  end

  add_index "accounts_settings", ["account_id"], :name => "index_accounts_settings_on_account_id"
  add_index "accounts_settings", ["setting_id"], :name => "index_accounts_settings_on_setting_id"

  create_table "activities", :force => true do |t|
    t.string   "session_id", :null => false
    t.string   "tablename",  :null => false
    t.integer  "entity_id",  :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "activities", ["created_at"], :name => "index_activities_on_created_at"
  add_index "activities", ["entity_id"], :name => "index_activities_on_entity_id"
  add_index "activities", ["session_id"], :name => "index_activities_on_session_id"
  add_index "activities", ["tablename"], :name => "index_activities_on_tablename"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email"
    t.string   "surname"
    t.string   "forename"
    t.string   "title"
    t.boolean  "admin"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "allocation_types", :force => true do |t|
    t.string   "description",                                  :null => false
    t.boolean  "is_assessment",             :default => false, :null => false
    t.boolean  "is_treatment",              :default => false, :null => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "default_appointment_count", :default => 1,     :null => false
    t.integer  "account_id",                :default => 0,     :null => false
  end

  create_table "allocation_types_templates", :id => false, :force => true do |t|
    t.integer "allocation_type_id", :null => false
    t.integer "template_id",        :null => false
  end

  add_index "allocation_types_templates", ["allocation_type_id", "template_id"], :name => "allocation_types_templates_index"

  create_table "allocations", :force => true do |t|
    t.integer  "episode_id"
    t.integer  "practitioner_id"
    t.integer  "allocation_type_id", :null => false
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "appointment_count"
  end

  add_index "allocations", ["episode_id"], :name => "index_allocations_on_episode_id"
  add_index "allocations", ["practitioner_id"], :name => "index_allocations_on_practitioner_id"

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.integer  "sequence"
    t.string   "answer"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "appointment_statuses", :force => true do |t|
    t.string   "description",     :null => false
    t.boolean  "is_dna",          :null => false
    t.boolean  "is_cancellation", :null => false
    t.boolean  "is_attended",     :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "account_id"
  end

  create_table "appointment_statuses_templates", :id => false, :force => true do |t|
    t.integer "appointment_status_id"
    t.integer "template_id"
  end

  add_index "appointment_statuses_templates", ["appointment_status_id"], :name => "index_appointment_statuses_templates_on_appointment_status_id"
  add_index "appointment_statuses_templates", ["template_id"], :name => "index_appointment_statuses_templates_on_template_id"

  create_table "appointments", :force => true do |t|
    t.integer  "allocation_id"
    t.string   "outcome"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "appointment_status_id"
    t.boolean  "counted"
    t.integer  "slot_date_id",          :null => false
  end

  add_index "appointments", ["allocation_id"], :name => "index_appointments_on_allocation_id"

  create_table "appointments_templates", :id => false, :force => true do |t|
    t.integer "appointment_id"
    t.integer "template_id"
  end

  add_index "appointments_templates", ["appointment_id"], :name => "index_appointments_templates_on_appointment_id"
  add_index "appointments_templates", ["template_id"], :name => "index_appointments_templates_on_template_id"

  create_table "clients", :force => true do |t|
    t.string   "file_no"
    t.string   "surname"
    t.string   "forename"
    t.date     "dob"
    t.string   "address"
    t.string   "postcode"
    t.string   "telephone_home"
    t.string   "telephone_mobile"
    t.string   "email"
    t.text     "notes"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "account_id",       :default => 0, :null => false
    t.string   "salutation"
  end

  create_table "clinics", :force => true do |t|
    t.integer  "practitioner_id"
    t.integer  "venue_id"
    t.date     "effective_from"
    t.integer  "day_of_week"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "clinics", ["practitioner_id"], :name => "index_clinics_on_practitioner_id"
  add_index "clinics", ["venue_id"], :name => "index_clinics_on_venue_id"

  create_table "contact_actions", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "contact_types", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "document_fields", :force => true do |t|
    t.string   "documentfield"
    t.string   "railsvariable"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "class_name"
  end

  add_index "document_fields", ["class_name"], :name => "index_document_fields_on_class_name"
  add_index "document_fields", ["documentfield"], :name => "index_document_fields_on_documentfield"
  add_index "document_fields", ["railsvariable"], :name => "index_document_fields_on_railsvariable"

  create_table "document_fields_templates", :id => false, :force => true do |t|
    t.integer "document_field_id"
    t.integer "template_id"
  end

  add_index "document_fields_templates", ["document_field_id", "template_id"], :name => "document_fields_templates_index"

  create_table "episode_contacts", :force => true do |t|
    t.datetime "contacted",         :null => false
    t.integer  "episode_id",        :null => false
    t.boolean  "from_client",       :null => false
    t.integer  "contact_type_id",   :null => false
    t.integer  "contact_action_id"
    t.integer  "user_id"
    t.text     "notes"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "episode_contacts", ["contact_action_id"], :name => "index_episode_contacts_on_contact_action_id"
  add_index "episode_contacts", ["contact_type_id"], :name => "index_episode_contacts_on_contact_type_id"
  add_index "episode_contacts", ["episode_id"], :name => "index_episode_contacts_on_episode_id"
  add_index "episode_contacts", ["user_id"], :name => "index_episode_contacts_on_user_id"

  create_table "episode_statuses", :force => true do |t|
    t.string   "episodestatus", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "episodes", :force => true do |t|
    t.date     "referral_date"
    t.string   "referred_by"
    t.string   "status"
    t.boolean  "closed",                              :null => false
    t.integer  "client_id",                           :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.text     "presenting_issue"
    t.string   "file_no"
    t.boolean  "urgent",           :default => false
  end

  add_index "episodes", ["client_id"], :name => "index_episodes_on_client_id"
  add_index "episodes", ["file_no"], :name => "index_episodes_on_file_no", :unique => true

  create_table "episodes_practitioners", :id => false, :force => true do |t|
    t.integer "episode_id",      :null => false
    t.integer "practitioner_id", :null => false
  end

  create_table "episodes_venues", :id => false, :force => true do |t|
    t.integer "episode_id", :null => false
    t.integer "venue_id",   :null => false
  end

  create_table "field_types", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "file_no_fields", :force => true do |t|
    t.string   "table"
    t.string   "column"
    t.integer  "field_type_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "file_no_fields", ["field_type_id"], :name => "index_file_no_fields_on_field_type_id"

  create_table "file_nos", :force => true do |t|
    t.integer  "account_id", :null => false
    t.integer  "file_no",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "file_nos", ["account_id"], :name => "index_file_nos_on_account_id"

  create_table "ideas", :force => true do |t|
    t.integer  "user_id"
    t.string   "url"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ideas", ["user_id"], :name => "index_ideas_on_user_id"

  create_table "media_types", :force => true do |t|
    t.integer  "account_id", :null => false
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "message_types", :force => true do |t|
    t.string   "description"
    t.boolean  "is_email",     :default => false, :null => false
    t.boolean  "is_printable", :default => false, :null => false
    t.boolean  "is_phone",     :default => false, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "episode_id",      :null => false
    t.integer  "template_id",     :null => false
    t.integer  "message_type_id", :null => false
    t.integer  "user_id",         :null => false
    t.datetime "completed"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "messages", ["episode_id"], :name => "index_messages_on_episode_id"
  add_index "messages", ["message_type_id"], :name => "index_messages_on_message_type_id"
  add_index "messages", ["template_id"], :name => "index_messages_on_template_id"
  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "practitioner_types", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "practitioner_types_practitioners", :id => false, :force => true do |t|
    t.integer "practitioner_type_id"
    t.integer "practitioner_id"
  end

  add_index "practitioner_types_practitioners", ["practitioner_id"], :name => "practitioner_types_practitions_practitioner_id"
  add_index "practitioner_types_practitioners", ["practitioner_type_id"], :name => "practitioner_types_practitions_practitioner_type_id"

  create_table "practitioner_types_users", :id => false, :force => true do |t|
    t.integer "practitioner_type_id", :null => false
    t.integer "user_id",              :null => false
  end

  add_index "practitioner_types_users", ["practitioner_type_id"], :name => "index_practitioner_types_users_on_practitioner_type_id"
  add_index "practitioner_types_users", ["user_id"], :name => "index_practitioner_types_users_on_user_id"

  create_table "practitioners", :force => true do |t|
    t.string   "telephone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id",    :null => false
  end

  create_table "print_jobs", :force => true do |t|
    t.integer  "user_id",                            :null => false
    t.boolean  "private_to_user", :default => false
    t.string   "content"
    t.string   "reference"
    t.integer  "media_type_id"
    t.string   "pdf_file"
    t.boolean  "printed"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "print_media_id"
    t.integer  "account_id",                         :null => false
  end

  add_index "print_jobs", ["account_id"], :name => "index_print_jobs_on_account_id"
  add_index "print_jobs", ["user_id"], :name => "index_print_jobs_on_user_id"

  create_table "print_media", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "print_queues", :force => true do |t|
    t.integer  "user_id",                             :null => false
    t.string   "medium",                              :null => false
    t.string   "entity",                              :null => false
    t.integer  "entity_id",                           :null => false
    t.integer  "print_template_id",                   :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.boolean  "printed",           :default => true
  end

  add_index "print_queues", ["print_template_id"], :name => "index_print_queues_on_print_template_id"
  add_index "print_queues", ["user_id"], :name => "index_print_queues_on_user_id"

  create_table "print_templates", :force => true do |t|
    t.integer  "account_id"
    t.string   "description"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "print_templates", ["account_id"], :name => "index_print_templates_on_account_id"

  create_table "questionnaires", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "questionnaire_id"
    t.integer  "sequence"
    t.string   "question"
    t.boolean  "options"
    t.boolean  "multi"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "questions", ["questionnaire_id"], :name => "index_questions_on_questionnaire_id"

  create_table "settings", :force => true do |t|
    t.string   "tag"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "valuetype"
  end

  add_index "settings", ["tag"], :name => "index_settings_on_tag", :unique => true

  create_table "slot_dates", :force => true do |t|
    t.date     "appointment_date",   :null => false
    t.integer  "slot_id",            :null => false
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.boolean  "single_appointment"
  end

  create_table "slots", :force => true do |t|
    t.integer  "clinic_id"
    t.time     "start_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "duration"
  end

  add_index "slots", ["clinic_id"], :name => "index_slots_on_clinic_id"

  create_table "templates", :force => true do |t|
    t.integer  "account_id"
    t.string   "name"
    t.string   "description"
    t.string   "filename"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "template_file_name"
    t.string   "template_content_type"
    t.integer  "template_file_size"
    t.datetime "template_updated_at"
    t.integer  "media_type_id"
  end

  add_index "templates", ["account_id"], :name => "index_templates_on_account_id"

  create_table "temporary_imports", :force => true do |t|
    t.string   "file_no"
    t.string   "forename"
    t.string   "surname"
    t.date     "dob"
    t.string   "phone"
    t.string   "address1"
    t.string   "address2"
    t.string   "town"
    t.string   "postcode"
    t.string   "referred_by"
    t.string   "dateref_text"
    t.date     "referred_date"
    t.string   "ia_counsellor"
    t.string   "ia_location"
    t.date     "ia_date"
    t.string   "counsellor"
    t.string   "location"
    t.date     "counselling_start_date"
    t.string   "status"
    t.string   "rogue_address"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "temporary_imports_orig", :force => true do |t|
    t.string "file_no",                :limit => 9
    t.string "forename",               :limit => 17
    t.string "surname",                :limit => 18
    t.string "dob_text",               :limit => 21
    t.date   "dob"
    t.string "phone",                  :limit => 47
    t.string "address",                :limit => 512
    t.string "address1",               :limit => 42
    t.string "address2",               :limit => 28
    t.string "town",                   :limit => 20
    t.string "postcode",               :limit => 19
    t.string "referred_by",            :limit => 27
    t.string "dateref_text",           :limit => 3573
    t.date   "referred_date"
    t.string "ia_counsellor",          :limit => 24
    t.string "ia_location",            :limit => 15
    t.date   "ia_date"
    t.string "counsellor",             :limit => 41
    t.string "location",               :limit => 12
    t.date   "counselling_start_date"
    t.string "status",                 :limit => 16
    t.string "rogue_address",          :limit => 56
    t.text   "notes"
  end

  create_table "trigger_types", :force => true do |t|
    t.string   "name"
    t.boolean  "is_print"
    t.boolean  "is_script"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "triggers", :force => true do |t|
    t.integer  "allocation_type_id"
    t.integer  "trigger_type_id"
    t.integer  "object_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "triggers", ["allocation_type_id"], :name => "index_triggers_on_allocation_type_id"
  add_index "triggers", ["trigger_type_id"], :name => "index_triggers_on_trigger_type_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "surname",                                   :null => false
    t.string   "forename",                                  :null => false
    t.string   "title"
    t.integer  "account_id",             :default => 0,     :null => false
    t.boolean  "admin",                  :default => false
    t.boolean  "male",                   :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "postcode"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "account_id", :default => 0, :null => false
  end

  add_foreign_key "clinics", "users", :name => "clinics_practitioner_id_fk", :column => "practitioner_id", :dependent => :delete
  add_foreign_key "clinics", "venues", :name => "clinics_venue_id_fk", :dependent => :delete

  add_foreign_key "episode_contacts", "contact_actions", :name => "episode_contacts_contact_action_id_fk"
  add_foreign_key "episode_contacts", "contact_types", :name => "episode_contacts_contact_type_id_fk"
  add_foreign_key "episode_contacts", "episodes", :name => "episode_contacts_episode_id_fk", :dependent => :delete
  add_foreign_key "episode_contacts", "users", :name => "episode_contacts_user_id_fk"

  add_foreign_key "slots", "clinics", :name => "slots_clinic_id_fk", :dependent => :delete

end
