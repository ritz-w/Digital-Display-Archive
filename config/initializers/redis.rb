uri = URI.parse(ENV.fetch("REDISTOGO_URL", "redis://redistogo:74fef00d09bf0fe0143910314a58b0cb@angelfish.redistogo.com:11784/"))
$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

