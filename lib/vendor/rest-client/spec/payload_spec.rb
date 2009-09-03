require File.dirname(__FILE__) + "/base"

describe RestClient::Payload do
	context "A regular Payload" do
		it "should should default content-type to standard enctype" do
			RestClient::Payload::UrlEncoded.new({}).headers['Content-Type'].
				should == 'application/x-www-form-urlencoded'
		end

		it "should form properly encoded params" do
			RestClient::Payload::UrlEncoded.new({:foo => 'bar'}).to_s.
				should == "foo=bar"
		end
	end

	context "A multipart Payload" do
		it "should should default content-type to standard enctype" do
			m = RestClient::Payload::Multipart.new({})
			m.stub!(:boundary).and_return(123)
			m.headers['Content-Type'].should == 'multipart/form-data; boundary="123"'
		end

		it "should form properly seperated multipart data" do
			m = RestClient::Payload::Multipart.new({:foo => "bar", :bar => 'foo'})
			m.to_s.should == <<-EOS
--#{m.boundary}\r
Content-Disposition: multipart/form-data; name="bar"\r
\r
foo\r
--#{m.boundary}\r
Content-Disposition: multipart/form-data; name="foo"\r
\r
bar\r
--#{m.boundary}--\r
EOS
		end

		it "should form properly seperated multipart data" do
			f = File.new(File.dirname(__FILE__) + "/master_shake.jpg")
			m = RestClient::Payload::Multipart.new({:foo => f})
			m.to_s.should == <<-EOS
--#{m.boundary}\r
Content-Disposition: multipart/form-data; name="foo"; filename="./spec/master_shake.jpg"\r
Content-Type: image/jpeg\r
\r
#{IO.read(f.path)}\r
--#{m.boundary}--\r
EOS
		end
	end

	context "Payload generation" do
		it "should recognize standard urlencoded params" do
			RestClient::Payload.generate({"foo" => 'bar'}).should be_kind_of(RestClient::Payload::UrlEncoded)
		end
		
		it "should recognize multipart params" do
			f = File.new(File.dirname(__FILE__) + "/master_shake.jpg")

			RestClient::Payload.generate({"foo" => f}).should be_kind_of(RestClient::Payload::Multipart)
		end
		
		it "should be multipart if forced" do
			RestClient::Payload.generate({"foo" => "bar", :multipart => true}).should be_kind_of(RestClient::Payload::Multipart)
		end

		it "should return data if no of the above" do
		  RestClient::Payload.generate("data").should be_kind_of(RestClient::Payload::Base)
		end
	end
end
