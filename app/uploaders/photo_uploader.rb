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
    cloudinary_transformation gravity: :face, width: 250, crop: :thumb, zoom: 0.2, height: 200
  end

  version :layout_01 do
    cloudinary_transformation gravity: :face, width: 500, height: 700, crop: :fill, zoom: 0.1
  end

  version :layout_01_fx do
    cloudinary_transformation transformation: [{gravity: :face, width: 500, height: 700, crop: :fill, zoom: 0.1},
    {effect: "art:fes", opacity:80}, {effect: "gradient_fade:.05,y_-0.1,b_black"}]
  end

  version :fx do
    cloudinary_transformation transformation: [{gravity: :face, crop: :fill, zoom: 0.1},
     { effect: "art:peacock" }, {effect: "colorize:2", color: "yellow" }]
  end

  version :layout_02 do
    cloudinary_transformation gravity: :face, width: 500, height: 550, crop: :fill, zoom: 0.1
  end

  version :layout_03 do
    cloudinary_transformation gravity: :face, width: 500, height: 380, crop: :fill, zoom: 0.1
  end

  version :layout_04 do
    cloudinary_transformation gravity: :face, width: 500, height: 300, crop: :fill, zoom: 0.1
  end

  version :layout_05 do
    cloudinary_transformation gravity: :face, width: 250, height: 320, crop: :fill, zoom: 0.1
  end

  version :layout_06 do
    cloudinary_transformation gravity: :face, width: 240, height: 320, crop: :fill, zoom: 0.1
  end



  # -------
  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 20,
    gravity: :face
  end



end
