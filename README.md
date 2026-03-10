# Spectacle for Rails

Generate beautiful static API documentation from OpenAPI/Swagger specifications directly in your Rails app.

This gem wraps [spectacle-docs](https://github.com/sourcey/spectacle) to provide Rake tasks and configuration for generating API docs as part of your Rails workflow.

## Prerequisites

- Node.js >= 20
- npm

## Installation

Add to your Gemfile:

```ruby
gem 'spectacle'
```

Then install the spectacle-docs npm package:

```bash
rake spectacle:install
# or: npm install -g spectacle-docs
```

## Configuration

Create an initializer at `config/initializers/spectacle.rb`:

```ruby
Spectacle::Config.spec_file = Rails.root.join('public/openapi.yaml').to_s
Spectacle::Config.output_dir = Rails.root.join('public/docs').to_s

# Optional
Spectacle::Config.logo = Rails.root.join('app/assets/images/logo.png').to_s
Spectacle::Config.embeddable = true   # Strip <html>/<body> tags for embedding
Spectacle::Config.single_file = true  # Bundle everything into one HTML file
```

### Defaults

| Option | Default |
|--------|---------|
| `spec_file` | `public/openapi.yaml` |
| `output_dir` | `public/docs` |
| `logo` | `nil` |
| `embeddable` | `false` |
| `single_file` | `false` |
| `spectacle_bin` | `npx spectacle` |

## Usage

### Generate docs

```bash
rake spectacle:generate
```

This reads your OpenAPI spec and writes `index.html`, `spectacle.css`, and `spectacle.js` to the output directory.

### Validate your spec

```bash
rake spectacle:validate
```

### Install spectacle-docs

```bash
rake spectacle:install
```

## Supported specs

- OpenAPI 3.0 / 3.1
- Swagger 2.0 (auto-converted to OpenAPI 3.0)
- JSON or YAML format

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT
