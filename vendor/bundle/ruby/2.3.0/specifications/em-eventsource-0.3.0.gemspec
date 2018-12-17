# -*- encoding: utf-8 -*-
# stub: em-eventsource 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "em-eventsource".freeze
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Fran\u{e7}ois de Metz".freeze]
  s.date = "2018-10-03"
  s.description = "     em-eventsource is an eventmachine library to consume Server-Sent Events streaming API.\n     You can find the specification here: http://dev.w3.org/html5/eventsource/\n".freeze
  s.email = "francois@2metz.fr".freeze
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "https://github.com/francois2metz/em-eventsource".freeze
  s.rubygems_version = "2.5.2.3".freeze
  s.summary = "em-eventsource is an eventmachine library to consume Server-Sent Events streaming API.".freeze

  s.installed_by_version = "2.5.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<em-http-request>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 2.0"])
      s.add_development_dependency(%q<minitest-spec-context>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<eventmachine>.freeze, ["~> 1.0"])
      s.add_dependency(%q<em-http-request>.freeze, ["~> 1.0"])
      s.add_dependency(%q<minitest>.freeze, [">= 2.0"])
      s.add_dependency(%q<minitest-spec-context>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<eventmachine>.freeze, ["~> 1.0"])
    s.add_dependency(%q<em-http-request>.freeze, ["~> 1.0"])
    s.add_dependency(%q<minitest>.freeze, [">= 2.0"])
    s.add_dependency(%q<minitest-spec-context>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
