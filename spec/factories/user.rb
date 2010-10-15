Factory.define :user do |user|
  user.sequence(:username) {|n| "artem#{n}" }
  user.email {|a| "#{a.username}@example.com".downcase }
  user.authentications {|u| [ Factory(:authentication, :user_id => u.id) ] }
end
