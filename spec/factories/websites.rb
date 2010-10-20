# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :website do |f|
  f.sequence(:fqdn) {|n| "fqdn#{n}"}
  f.name "MyString"
  f.description "MyText"
end
