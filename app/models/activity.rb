class Activity < ActiveRecord::Base
  belongs_to :user
  attr_accessible :entity_id, :session_id, :tablename

  def age
    Time.now - self.updated_at
  end

  def fullname
    self.user.fullname
  end

  def self.log(r, u, obj)
    a = Activity.find_or_create_by_session_id_and_tablename_and_entity_id_and_user_id(
      r.session_options[:id],
      obj.class.table_name,
      obj.id,
      u.id
    ).touch

    #
    # Delete all other records of this type being looked at by this user
    #
#    ids = Activity.find("session_id = ? and not (tablename = ? and entity_id = ?)",
#      r.session_options[:id], obj.class.table_name, obj.id)
#    Activity.delete(ids) if ids.count > 0
  end

  def self.check(r, u, obj)
    Activity.where("session_id != ? and tablename = ? and entity_id = ? and updated_at > ?",
      r.session_options[:id],
      obj.class.table_name,
      obj.id,
      Time.now - 1.hour
    ).order("updated_at desc")
  end

end
