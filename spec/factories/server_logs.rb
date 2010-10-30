# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :server_log do |f|
  f.website {|ws| ws.association(:website, :user => Factory(:user)) }
  f.filename "filename"
end
