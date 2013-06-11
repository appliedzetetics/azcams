# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "surveyor"
  s.version = "0.20.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Chamberlain", "Mark Yoon"]
  s.date = "2011-07-11"
  s.email = "yoon@northwestern.edu"
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md"]
  s.homepage = "http://github.com/NUBIC/surveyor"
  s.post_install_message = "Thanks for installing surveyor! The time has come to run the surveyor generator and migrate your database, even if you are upgrading."
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.17"
  s.summary = "A rails (gem) plugin to enable surveys in your application"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<haml>, [">= 0"])
      s.add_runtime_dependency(%q<sass>, [">= 0"])
      s.add_runtime_dependency(%q<fastercsv>, [">= 0"])
      s.add_runtime_dependency(%q<formtastic>, [">= 0"])
      s.add_runtime_dependency(%q<uuid>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<sass>, [">= 0"])
      s.add_dependency(%q<fastercsv>, [">= 0"])
      s.add_dependency(%q<formtastic>, [">= 0"])
      s.add_dependency(%q<uuid>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<sass>, [">= 0"])
    s.add_dependency(%q<fastercsv>, [">= 0"])
    s.add_dependency(%q<formtastic>, [">= 0"])
    s.add_dependency(%q<uuid>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
