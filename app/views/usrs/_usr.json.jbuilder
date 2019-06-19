json.extract! usr, :id, :name, :email, :login, :created_at, :updated_at
json.url usr_url(usr, format: :json)
