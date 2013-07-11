require 'spec_helper'

describe Contact do
  describe "must be valid" do
    it "should reject nil name" do
      contact = Contact.new( number: "1123213029" )
      contact.should_not be_valid
    end
    it "should reject nil number" do
      contact = Contact.new( name: "Ash Skutches" )
      contact.should_not be_valid
    end
  end
end
