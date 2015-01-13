class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :admin, type: Boolean, default: false
  attr_reader :password

  mount_uploader :image, AvatarUploader

  has_and_belongs_to_many :activities

  # def add_activity(activity_id)
  #     # @user = User.find(params[:id])
  #     @activity = Activity.find(activity_id)
  #     self[:activities].push(@activity)
  # end

  def password=(unencrypted_password)
  	unless unencrypted_password.empty?
	  	# keep the unencrypted password in memory for a second
	  	@password = unencrypted_password
	  	self.password_digest = BCrypt::Password.create(unencrypted_password)
	end
  end

  def authenticate(unencrypted_password)
  	if BCrypt::Password.new(self.password_digest)
  		return self
  	else
  		return false
  	end
  end

  validates :name, presence: true, on: :create
  

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, on: :create

  validates :password, presence: true, length: { in: 6..20}, confirmation: true, on: :create

end
