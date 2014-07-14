require "json"

sso_enabled = JSON.parse(ENV["VCAP_APPLICATION"])["sso_enabled"]

file = "public/css/screen.css"

# when sso is enabled use https for loading font from
# http://fonts.googleapis.com/css?family=Lobster
if sso_enabled
  text = File.read(file)
  text.gsub!("http://", "https://")
  File.open(file, "w") {|f| f.puts text}
end
