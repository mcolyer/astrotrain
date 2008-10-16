require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe LoggedMail do
  describe "being created from Message" do
    before :all do
      @raw     = mail(:basic)
      @message = Message.parse(@raw)
      @logged  = LoggedMail.from(@message)
    end

    it "sets recipient" do
      @logged.recipient.should == @message.recipient
    end

    it "sets subject" do
      @logged.subject.should == @message.subject
    end

    it "sets raw headers" do
      @logged.raw.should == @raw
    end
  end

  describe "logging mapping message" do
    before :all do
      @raw     = mail(:basic)
      @message = Message.parse(@raw)
      User.transaction do
        User.all.destroy!
        Mapping.all.destroy!
        @user    = User.create!(:login => 'user')
        @mapping = @user.mappings.create!(:email_user => 'xyz')
        @logged  = @message.log_to @mapping
      end
      @logged.reload
    end

    it "sets mapping" do
      @logged.mapping.should == @mapping
    end

    it "sets recipient" do
      @logged.recipient.should == @message.recipient
    end

    it "sets subject" do
      @logged.subject.should == @message.subject
    end

    it "sets raw headers" do
      @logged.raw.should == @raw
    end
  end
end