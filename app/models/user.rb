class User < ActiveRecord::Base

  has_secure_password

  has_many :tweets
  has_many :followers

  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true


  has_attached_file :avatar, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  after_save :slugger
  # acts_as_url :slug

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

private

  def slugger
    self.slug = self.name.parameterize
    self.update_column(:slug, self.slug)
  end

end
