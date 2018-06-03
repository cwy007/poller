class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :votes, dependent: :destroy
  has_many :vote_options,through: :votes

  def display_name
    email.split('@').first
  end

  def voted_for?(poll)
    vote_options.any? { |v| v.poll == poll }
  end
end
