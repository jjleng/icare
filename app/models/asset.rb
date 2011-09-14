class Asset < ActiveRecord::Base
  belongs_to :post

  has_attached_file :image,
                    :styles =>{
                        :thumb => '100x100>',
                        :medium => '300x300>',
                        :large => '600x600>'
                    },
                    :storage => :s3,
                    :bucket => 'media.smartbee.heroku.com',
                    :s3_permissions => :private,
                    #:path => "photos/:id/:filename",
                    :s3_credentials => {
                        :access_key_id => ENV['S3_KEY'],
                        :secret_access_key => ENV['S3_SECRET']
                    }
end
