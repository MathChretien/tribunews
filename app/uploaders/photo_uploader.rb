class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true

  version :frontpage do
    cloudinary_transformation transformation: [
      {crop: :fill, height: 860, width: 570, gravity: :face, effect: "fill_light:200:10"},
      {effect: "gradient_fade:1.4,y_-0.8,b_black"}
    ]
  end

  version :thumbnail do
    cloudinary_transformation gravity: :face, width: 300, crop: :thumb, zoom: 0.2, height: 250
  end

  # -------
  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 20,
    gravity: :face
  end

  version :fes do
    cloudinary_transformation effect: "fes:30", radius: 80,
    gravity: :face
  end


end
