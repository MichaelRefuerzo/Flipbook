class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :avatar

  APPROVED_DOMAINS = ["tip.edu.ph"]
  validates :email, presence: true, if: :domain_check
  validates :student_id, presence: true, if: :student?
  validates_uniqueness_of :student_id, message: "ID has already been taken", if: :student?
  validates :employee_id, presence: true, unless: :student?
  validates_uniqueness_of :employee_id, message: "ID has already been taken", unless: :student?
  before_validation :assign_default_role

  def domain_check
    unless APPROVED_DOMAINS.any? { |word| email.end_with?(word)}
      errors.add(:email, "should have a T.I.P. domain")
    end
  end

  def student?
    role == 'student'
  end


  def assign_default_role
    self.role ||= 'student'
  end
end
