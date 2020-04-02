# frozen_string_literal: true

require 'shrine'
require 'cloudinary'
require 'shrine/storage/cloudinary'

Cloudinary.config(
  cloud_name: ENV['CLOUDINARY_CLOUD_NAME'],
  api_key: ENV['CLOUDINARY_API_KEY'],
  api_secret: ENV['CLOUDINARY_API_SECRET']
)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: 'public/uploads/cache'),
  store: Shrine::Storage::Cloudinary.new(prefix: 'public/uploads')
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :data_uri
