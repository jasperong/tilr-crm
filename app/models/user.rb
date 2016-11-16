class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :contacts, dependent: :destroy

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(
          first_name: data["first_name"],
          last_name: data["last_name"],
          email: data["email"],
          password: Devise.friendly_token[0,20]
        )
    end
    user
  end

  def name_list
    names = []
    self.contacts.each do |cont|
      names << "#{cont.first_name} #{cont.last_name}"
    end
    names
  end

  def import_contacts(contacts)
    contacts.each do |contact|
      unless name_list.include?("#{contact.first_name} #{contact.last_name}")
        self.contacts.create(
          first_name: contact[:first_name],
          last_name: contact[:last_name],
          email: contact[:email],
          phone_number: contact[:phone_number],
          avatar: contact[:profile_picture],
          company: nil
        )
      end
    end
  end
end
