class User < ApplicationRecord
  include ActiveModel::Conversion
  include ActiveModel::Naming
  include ActiveModel::Validations

  attr_accessor :first_name, :last_name, :email, :company_name, :estimated_annual_projects, :estimated_annual_products, :customer_type, :agree

  
  validates :first_name, :last_name, :email, :company_name, :customer_type, :agree, :presence => true
  validates :estimated_annual_projects, :estimated_annual_products, :numericality => {:greater_than_or_equal_to => 1}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def initialize(*args)
    puts "Received arguments: #{args}"
    @email = *args[:email]
    @first_name = *args[:first_name]
    @last_name = *args[:last_name]
    @company_name = *args[:company_name]
    @estimated_annual_projects = *args[:estimated_annual_projects]
    @estimated_annual_products = *args[:estimated_annual_products]
    @customer_type = *args[:customer_type]
    @agree = *args[:agree]

    super(*args)
    # attributes.each do |key, value|
    #   send("#{key}=", value)
    # end
    # instance.send :initialize
    # instance
  end
     
  def persisted?
    false
  end
end
