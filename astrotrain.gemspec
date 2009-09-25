# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{astrotrain}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["technoweenie"]
  s.date = %q{2009-09-25}
  s.email = %q{technoweenie@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README",
     "Rakefile",
     "VERSION",
     "astrotrain.gemspec",
     "config/sample.rb",
     "lib/astrotrain.rb",
     "lib/astrotrain/api.rb",
     "lib/astrotrain/logged_mail.rb",
     "lib/astrotrain/mapping.rb",
     "lib/astrotrain/mapping/http_post.rb",
     "lib/astrotrain/mapping/jabber.rb",
     "lib/astrotrain/mapping/transport.rb",
     "lib/astrotrain/message.rb",
     "lib/astrotrain/tmail.rb",
     "lib/vendor/rest-client/README.rdoc",
     "lib/vendor/rest-client/Rakefile",
     "lib/vendor/rest-client/bin/restclient",
     "lib/vendor/rest-client/foo.diff",
     "lib/vendor/rest-client/lib/rest_client.rb",
     "lib/vendor/rest-client/lib/rest_client/net_http_ext.rb",
     "lib/vendor/rest-client/lib/rest_client/payload.rb",
     "lib/vendor/rest-client/lib/rest_client/request_errors.rb",
     "lib/vendor/rest-client/lib/rest_client/resource.rb",
     "lib/vendor/rest-client/rest-client.gemspec",
     "lib/vendor/rest-client/spec/base.rb",
     "lib/vendor/rest-client/spec/master_shake.jpg",
     "lib/vendor/rest-client/spec/payload_spec.rb",
     "lib/vendor/rest-client/spec/request_errors_spec.rb",
     "lib/vendor/rest-client/spec/resource_spec.rb",
     "lib/vendor/rest-client/spec/rest_client_spec.rb",
     "test/api_test.rb",
     "test/fixtures/apple_multipart.txt",
     "test/fixtures/bad_content_type.txt",
     "test/fixtures/basic.txt",
     "test/fixtures/custom.txt",
     "test/fixtures/fwd.txt",
     "test/fixtures/gb2312_encoding.txt",
     "test/fixtures/gb2312_encoding_invalid.txt",
     "test/fixtures/html.txt",
     "test/fixtures/iso-8859-1.txt",
     "test/fixtures/mapped.txt",
     "test/fixtures/multipart.txt",
     "test/fixtures/multipart2.txt",
     "test/fixtures/multiple.txt",
     "test/fixtures/multiple_delivered_to.txt",
     "test/fixtures/multiple_with_body_recipients.txt",
     "test/fixtures/reply.txt",
     "test/fixtures/utf-8.txt",
     "test/logged_mail_test.rb",
     "test/mapping_test.rb",
     "test/message_test.rb",
     "test/test_helper.rb",
     "test/transport_test.rb"
  ]
  s.homepage = %q{http://github.com/entp/astrotrain}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{email => http post}
  s.test_files = [
    "test/api_test.rb",
     "test/logged_mail_test.rb",
     "test/mapping_test.rb",
     "test/message_test.rb",
     "test/test_helper.rb",
     "test/transport_test.rb"
  ]

  s.requirements << "For Jabber Support: xmpp4r-simple gem"
  s.requirements << "For the web API: Sinatra"
  s.requirements << "For testing: Context and RR"

  s.add_dependency 'addressable',   '2.0.2'
  s.add_dependency "tmail",         "1.2.3.1"

  dm_ver = "0.9.11"
  s.add_dependency "dm-core",        dm_ver # The datamapper ORM
  s.add_dependency "dm-aggregates",  dm_ver # Provides your DM models with count, sum, avg, min, max, etc.
  s.add_dependency "dm-timestamps",  dm_ver # Automatically populate created_at, created_on, etc. when those properties are present.
  s.add_dependency "dm-types",       dm_ver # Provides additional types, including csv, json, yaml.
  s.add_dependency "dm-validations", dm_ver # Validation framework

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end