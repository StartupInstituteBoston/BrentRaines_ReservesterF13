require 'spec_helper'

describe User do
  before { @user = FactoryGirl.create(:user) }
  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:encrypted_password) }
  it { should respond_to(:role) }

  it { should be_valid }

  describe "when first name is not present" do
    before { @user.first_name = " " }
    it { should_not be_valid }
  end

  describe "when last name is not present" do
    before { @user.last_name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email is already taken" do
    before { @invalid_user = @user.dup }
    subject { @invalid_user }
    it { should_not be_valid }
  end
end
