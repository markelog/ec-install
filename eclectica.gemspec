Gem::Specification.new do |s|
  s.name        = "eclectica"
  s.version     = "0.8.2"
  s.licenses    = "MIT"
  s.author      = "Oleg Gaidarenko"
  s.email       = "markelog@gmail.com"
  s.homepage    = "https://github.com/markelog/eclectica#readme"
  s.summary     = "Version manager for any language"
  s.description = "Cool and eclectic version manager for any language"

  s.extensions  = "extconf.rb"
  s.executables = ["ec", "ec-proxy"]
  s.files       = ["scripts/install.sh"]
end
