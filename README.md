# `Time::Span` String Converter for JSON & YAML

Provides a `Time::Span::StringConverter` module for parsing and serializing `Time::Span` objects as strings.
Can be used standalone or with JSON & YAML.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     tssc:
       github: Sija/tssc.cr
   ```

2. Run `shards install`

## Usage

### Standalone

```crystal
require "tssc"

Time::Span::StringConverter.parse("1 hour, 15 minutes") # => 01:15:00
Time::Span::StringConverter.dump(1.hour + 15.minutes)   # => "1 hour, 15 minutes"
```

### JSON & YAML

```crystal
require "json"
require "yaml"
require "tssc"

record FooWithTimeSpan, ttl : Time::Span? do
  include JSON::Serializable
  include YAML::Serializable

  @[JSON::Field(converter: Time::Span::StringConverter)]
  @[YAML::Field(converter: Time::Span::StringConverter)]
  @ttl : Time::Span?
end

foo = FooWithTimeSpan.from_yaml("ttl: 1 hour, 15 minutes")
foo.ttl # => 01:15:00
```

> [!TIP]
> Valid string examples:
>
> - `1w2d3h4m5s`
> - `1w 2d 3h 4m 5s`
> - `1w 2d 3h 4 min 5 sec`
> - `1 week 2 days 3 hours 4 minutes 5 seconds`
> - `1 week, 2 days, 3 hours, 4 minutes, 5 seconds`

> [!NOTE]
> Allowed suffixes:
>
> - week: `w`, `week(s)`
> - day: `d`, `day(s)`
> - hour: `h`, `hour(s)`
> - minute: `m`, `min`, `minute(s)`
> - second: `s`, `sec`, `second(s)`
> - nanosecond: `ns`, `nanosecond(s)`

## Contributing

1. Fork it (<https://github.com/Sija/tssc.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Sijawusz Pur Rahnama](https://github.com/Sija) - creator and maintainer
