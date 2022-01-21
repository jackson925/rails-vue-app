class User < ApplicationRecord
  include ActiveModel::Conversion
  include ActiveModel::Naming
  include ActiveModel::Validations

  attr_accessor :first_name, :last_name, :email, :company_name, :annual_estimated_projects, :annual_estimated_products

  
  validates :first_name, :last_name, :email, :company_name, :presence => true
  validates :annual_estimated_projects, :annual_estimated_products, :numericality => {:greater_than_or_equal_to => 1}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
     
  def persisted?
    false
  end

end


class User < ApplicationRecord
 


end