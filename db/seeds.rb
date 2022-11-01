charities = YAML.load_file(Rails.root.join("test", "fixtures", "charities.yml").to_s)
users = YAML.load_file(Rails.root.join("test", "fixtures", "users.yml").to_s)

app = App.new

charities.each do |_,c|
  unless Charity.exists?(name: c["name"])
    app.create_charity(name: c["name"])
  end
end

users.each do |_,c|
  unless User.exists?(email: c["email"])
    app.create_user(email: c["email"], encrypted_password: c["encrypted_password"], password: c["encrypted_password"])
  end
end
