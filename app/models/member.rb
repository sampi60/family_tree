class Member < User
  attr_accessor :skip_password_validation

  belongs_to :parent_1, class_name: 'Member', foreign_key: 'parent_1', optional: true
  belongs_to :parent_2, class_name: 'Member', foreign_key: 'parent_2', optional: true

  def to_s
    "#{first_name} #{last_name}"
  end

  protected

    def password_required?
      return false if skip_password_validation
      super
    end
end
