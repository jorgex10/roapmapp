class SessionSerializer < ActiveModel::Serializer
  attributes :id, :access_token, :expires_at
end