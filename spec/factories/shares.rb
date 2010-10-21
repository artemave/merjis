# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :share do |f|
  f.user_id 1
  f.receiver_id 1
  f.resource_id 1
  f.resource_type "MyString"
end
