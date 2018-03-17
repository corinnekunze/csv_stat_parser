# CsvStatParser

Intended to be used to parsing CSV Survey Data and making deeper comparisons between data sets.

Development in progress.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'csv_stat_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install csv_stat_parser

## Usage

Run `bin/console` for an interactive prompt.


### Initialize the Parser

You must first initialize the parser, either with custom headers or you may leave the default ones from your CSV.

To parse your CSV with default headers:

```
parser = CsvStatParser::Parser.new
```

It's common for CSV headers to be unwieldy to write out to query records so I suggest you map to new ones.

They will be determined by the order in which your headers appear, so say your CSV looks like so:

```
First Name,Last Name,Number of Dogs,Number of Cats,Nubmer of Birds, Number of Fish
Dan,McAllister,2,0,,
Lucy,Laweless,,5,0,
,,,,,
Miles,O'Brian,0,0,0,21
Nancy,Homes,2,0,1,
Hernán,Curaçon,3,0,0,
,,,,,

```

You can pass in your headers as a array to overwite the existing ones, so for above example CSV:
```
parser = CsvStatParser:Parser.new([first_name, last_name, dogs, cats, birds, fish])

```

### Parse your data

Next, parse the data with a file name like so:

```
parsed_data = parser.parse('/path/to/file.csv')
```

This will return a hash of values for you to do whatever youd like with it.

### Query your parsed data

csv_stat_parser allows you to make comparisons on this data with the `find_records` method.

For instance, this finds all records where the 'male' column is selected as '1'
```
parsed_data.find_records('gender', '1')
```

You may also query by multiple header attributes OR by multiple values by passing in an array. For example:

Records where either male OR female is selected

```
female_or_male = parsed_data.find_records(['male', 'female'], '1')
```

Records where big cats are selected
```
big_cats = parsed_data.find_records('animals', ['panther', 'tiger', 'lion'])
```

*Note* The `find_records` will return a CsvStatParser Collection class so you can further scope or make comparisons from there.

Examples:
```
women = parsed_data.find_records('female', '1')
female_managers = women.find_records('manager', '1')

# percentage of women that are managers
female_managers.size / women.size
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/corinnekunze/csv_stat_parser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

