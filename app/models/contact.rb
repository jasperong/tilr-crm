class Contact < ApplicationRecord
  belongs_to :user
  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },
    storage: :s3,
    default_url: ':style/default.png',
    :url =>':s3_domain_url',
    :path => '/:class/:attachment/:id_partition/:style/:filename'

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
