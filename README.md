# Kubo

Opinionated tools for Kubernetes deployment and management

## Installation

- Install the gem: `gem install kubo`

## Usage

Create the config file at `PROJECT_ROOT/.kubo.yml`. This is an example configuration:

```yml
staging:
  namespace: ns-staging
  cluster: <cluster>
production:
  namespace: ns-production
  cluster: <cluster>
```

To start deploy

```sh
kubo deploy environment your-branch
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/kubo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Kubo project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/kubo/blob/master/CODE_OF_CONDUCT.md).
