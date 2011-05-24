# By using the symbol ':user' we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                   "test test"
  user.email                  "test@test.com"
  user.password               "testtest"
  user.password_confirmation  "testtest"
end
  