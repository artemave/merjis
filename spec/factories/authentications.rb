
Factory.define :authentication do |f|
  f.uid { "uid#{Factory.next(:uid)}" }

  f.after_create do |a|
    rand_name = Factory.next(:uid)
    a.create_user(:username => "test#{rand_name}", :email => "test#{rand_name}@example.com")
    a.save!
  end
end

Factory.sequence :uid do |n|
  n
end
