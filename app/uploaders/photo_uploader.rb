class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 20,
     gravity: :face
  end

  version :fes do
    cloudinary_transformation effect: "fes:30", radius: 80,
     gravity: :face
  end

end
