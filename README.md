# Plotlyrb

Use [plotly](https://plot.ly) to graph your data.

Currently only supports `plot_image`, `create_grid`, and `create_plot_from_grid`.

 - `plot_image` generates an image for your plot
 - `create_grid` creates grid data accessible through the web interface
 - `create_plot_from_grid` creates a plot based on the JSON representation of a grid

See [the python reference](https://plot.ly/python/reference/) for details on what you can plot.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'plotlyrb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install plotlyrb

## Usage

```ruby
require 'plotlyrb'

# NOTE: data argument must be an array of traces
data = [
  {
    :x => ['2013-10-04 22:23:00', '2013-11-04 22:23:00', '2013-12-04 22:23:00'],
    :y => [1, 3, 6],
    :type => 'scatter',
    :mode => 'markers',
  },
  {
    :pokemon => ['pikachu', 'squirtle', 'charmander'],
    :number_caught => [1, 3, 9],
    :type => 'scatter'
  }
]

layout = {
  :xaxis => { :title => 'times' },
  :yaxis => { :title => 'bigfoot sightings', :range => [0, 7] },
}

plot_spec = {
  :figure => {:data => data},
  :layout => layout,
  :format => :svg
}

plotly = Plotlyrb::ApiV2.auth_plotly('username', 'super secret API key')

plotly.plot_image(plot_spec, '/path/to/plot.svg')
```

## TODO
- [ ] Support height and width
- [ ] Test more plot types
- [ ] Use data structures/abstractions for plot types, data, etc. ?

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/plotlyrb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

