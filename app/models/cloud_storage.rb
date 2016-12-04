module CloudStorage
  def self.uploaded_url(photo_url)
    OpenStruct.new(
      Cloudinary::Uploader.upload(
        URI.encode(photo_url),
        CLOUDINARY_AUTH
      )
    ).url
  end
end
