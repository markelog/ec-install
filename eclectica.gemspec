Gem::Specification.new do |s|
  s.name        = "eclectica"
  s.version     = "0.0.1"
  s.licenses    = "MIT"
  s.author      = "Oleg Gaidarenko"
  s.email       = "markelog@gmail.com"
  s.homepage    = "https://github.com/markelog/eclectica#readme"
  s.summary     = "Cool and eclectic version manager for any language"
  s.description = "Cool and eclectic version manager for any language (ruby, rust, node.js, golang)"

  s.extensions  = "extconf.rb"
  s.executables = "ec"
  s.files       = ["install.sh"]
end
