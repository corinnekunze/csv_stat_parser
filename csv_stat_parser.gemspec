# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csv_stat_parser/version'

Gem::Specification.new do |spec|
  spec.name          = 'csv_stat_parser'
  spec.version       = CsvStatParser::VERSION
  spec.authors       = ['corinnekunze']
  spec.email         = ['corinnekunze@gmail.com']

  spec.summary       = %q{Parsing CSV data to get meaningful stats.}
  spec.description   = %q{Ability to compare between data sets of CSV to come up with meaningful statistics and relationships between data sets.}
  spec.homepage      = 'http://github.com/corinnekunze/csv_stat_parser'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
