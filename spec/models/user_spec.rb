require 'rails_helper'

RSpec.describe User, type: :model do
  subject {described_class.new(
    first_name: "anyFirstName",
    last_name: "anyLastName",
    email: "my@email.com",
    password: "abcdefghi",
    password_confirmation: "abcdefghi"
  )}

  describe 'Validations' do
  
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "must be created with both password and password_confirmation" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without last_name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if password length is less than 8" do
      subject.password = 'abc'
      subject.password_confirmation = 'abc'
      expect(subject).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should return user if it exists" do
      @user = User.create(first_name: 'any', last_name: 'name', email: 'email@email.com', password: 'ababcdcdcd', password_confirmation: 'ababcdcdcd')
      @getUser = @user.authenticate_with_credentials("email@email.com", 'ababcdcdcd')
      expect(@getUser).to_not be_nil
    end

    it "should return nil with wrong password" do
      @user = User.create(first_name: 'any', last_name: 'name', email: 'email@email.com', password: 'ababcdcdcd', password_confirmation: 'ababcdcdcd')
      @getUser = @user.authenticate_with_credentials("email@email.com", 'abcdefg')
      expect(@getUser).to be_nil
    end

    it "should authenticate even with trailing spaces" do
      @user = User.create(first_name: 'any', last_name: 'name', email: 'email@email.com', password: 'ababcdcdcd', password_confirmation: 'ababcdcdcd')
      @getUser = @user.authenticate_with_credentials(" email@email.com ", 'ababcdcdcd')
      expect(@getUser).to_not be_nil
    end
  end

end
  