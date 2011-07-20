require "spec_helper"

describe UserMailer do
  describe "password_reset" do
    let(:user) { Factory(:user) }
    let(:mail) { UserMailer.password_reset(user) }
    
    it "send user password reset url" do
      mail.subject.should eq("Password reset")
      mail.to.should eq([user.email])
      mail.from.should eq(["from@example.com"])
      mail.body.encoded.should match(edit_password_reset_path(user.password_reset_token))
    end
  end
end
