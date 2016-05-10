class User < ActiveRecord::Base
	acts_as_mappable :default_units => :miles, :default_formula => :sphere, :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :lng


	has_many :client_orders, class_name: "Order", foreign_key: "client_id"
	has_many :merchant_orders, class_name: "Order", foreign_key: "merchant_id"


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #validates :first_name, :last_name, :email, presence: true
end
