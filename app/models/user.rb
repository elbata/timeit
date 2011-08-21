class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable#,
         #:recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :registries
  has_many :planifications
  has_many :dedications

  def planifications_for_week week

    ps = self.planifications.find_all_by_week(week)

    result = {}

    (1..7).each do |day|
      p = ps.select { |p| p.day == day }
      result[day] = p.empty? ? Planification.create(:user_id => id, :day => day, :week => week, :hours => 0) : p.first
    end

    result

  end




end
