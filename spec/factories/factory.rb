Factory.define :valid_post, :class => :post do |r|
  r.title "factoried title"
end

Factory.define :valid_user, :class => :user do |f|
  f.email "factoriedemail@email.com"
  f.password "123456"
  f.password_confirmation "123456"
end

Factory.define :valid_asset, :class => :asset do |asset|
  asset.image_file_name "./123.png"
  asset.image_content_type "image/jpeg"
  asset.image_file_size 20
  asset.image_updated_at 1.hour.ago
  asset.association :post
end