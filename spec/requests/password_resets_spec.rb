require 'spec_helper'

describe "PasswordResets" do 

  before(:each) do
    user = Factory(:user)
    visit signin_path
  end

  it "emails user when requesting password reset" do
    click_link "forgot password"
    fill_in :email,       :with => user.email
    click_button "reset password"
    response.should render_template(root_path, :content => "Email sent")
    last_email.to.should include(user.email)
  end
end


#it "should include the followed user's microposts" do
#  Micropost.from_users_followed_by(@user).should include(@other_post)
#end
