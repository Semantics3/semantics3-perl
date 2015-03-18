requires 'Data::Dumper';
requires 'JSON::XS';
requires 'Moose';
requires 'methods';
requires 'LWP::UserAgent';
requires 'LWP::Protocol::https';
requires 'OAuth::Lite::Consumer';
requires 'HTTP::Request::Common';
requires 'MIME::Base64';
requires 'URI::Escape';
requires 'Test::Exception';
requires 'Throwable';
requires 'namespace::clean';

# Standard deps

requires 'B::Lint';
requires 'Test::Strict';
requires 'Devel::InnerPackage';

# Semantics3 Dependencies

on 'test' => sub {
	requires 'Test::More', '0.98';

	# Semantics3 Dependencies

}
