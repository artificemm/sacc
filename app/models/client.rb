class Client < ActiveRecord::Base
  MARITAL_STATUS = %w(single married widowed divorced)
  belongs_to :salesman, class_name: "User", foreign_key: "current_salesman_id"
  has_many :appointments, class_name: "Appointment"
  has_many :phones, dependent: :destroy

  accepts_nested_attributes_for :phones,reject_if: :all_blank, allow_destroy: true

  def fullname
    [name, paternal_lastname, maternal_lastname].join(" ")
  end
end
