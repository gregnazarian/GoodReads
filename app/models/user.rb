class User < ApplicationRecord

    
    after_create do 
        shelves=["All", "Have read", "Currently reading", "Want to read"]
        shelves.each do |shelf|
            Bookshelf.create(name: shelf, user_id: self.id)
        end
#  each book needs to be added to "All"
#  each book needs a status i.e. "Have read, currently reading, want to read"
#  for each book, you set the status. but then also can add it to a bookshelf
# 
#         
    end

    validates :email, :password_digest, :session_token, 
        presence: true
    
    validates :email, :session_token,
        uniqueness: true

    validates :password, 
        length: {minimum: 6, allow_nil: true}

    attr_reader :password


    after_initialize :ensure_session_token

    has_many :reviews, dependent: :destroy
    has_many :books
    has_many :bookshelves, dependent: :destroy
    

    def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    user && user.is_password?(password) ? user : nil
  end

  def set_activation_token
    self.activation_token = generate_unique_activation_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = generate_unique_session_token
    self.save!

    self.session_token
  end

  def ensure_session_token
    self.session_token ||= generate_unique_session_token
  end

  def generate_unique_session_token
    token = SecureRandom.urlsafe_base64(16)

    ##
    # Just in case there is a session_token conflict, make sure
    # not to throw a validation error at the user!
    ##
    while self.class.exists?(session_token: token)
      token = SecureRandom.urlsafe_base64(16)
    end

    token
  end

end
