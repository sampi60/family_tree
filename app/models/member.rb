class Member < User
  attr_accessor :skip_password_validation

  belongs_to :parent_1, class_name: 'Member', foreign_key: 'parent_1', optional: true
  belongs_to :parent_2, class_name: 'Member', foreign_key: 'parent_2', optional: true

  def to_s
    "#{first_name} #{last_name}"
  end

  def parents
    [ parent_1, parent_2 ].compact
  end

  def children
    User.where(parent_1: id).or(User.where(parent_2: id))
  end

  def siblings
    User.where(parent_1: parents).or(User.where(parent_2: parents)).where.not(id: id)
  end

  def self.search(q)
    where "first_name LIKE ? OR last_name LIKE ?", "%#{q}%", "%#{q}%"
  end

  protected

    def password_required?
      return false if skip_password_validation
      super
    end
end
