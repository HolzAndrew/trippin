json.array!(@invitations) do |invitation|
  json.extract! invitation, :id, :email, :accept, :trip_id
  json.url invitation_url(invitation, format: :json)
end
