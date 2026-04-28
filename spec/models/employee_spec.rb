require 'rails_helper'
RSpec.describe Employee, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      expect(build(:employee)).to be_valid
    end

    it "is invalid without a full name" do
      expect(build(:employee, full_name: nil)).to_not be_valid
    end

    it "requires a positive salary" do
      expect(build(:employee, salary: -500)).to_not be_valid
    end
  end
end
