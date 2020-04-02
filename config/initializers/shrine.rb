# frozen_string_literal: true

require 'shrine'
require 'cloudinary'
require 'shrine/storage/cloudinary'

Cloudinary.config(
  cloud_name: 'dqipfc8vz',
  api_key: '361764875525163',
  api_secret: 'iqOwc77YIEC_4proV6tnb61eYNo'
)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: 'public/uploads/cache'),
  store: Shrine::Storage::Cloudinary.new(prefix: 'public/uploads')
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :data_uri
