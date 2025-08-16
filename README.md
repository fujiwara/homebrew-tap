# fujiwara's Homebrew Tap

This is a Homebrew tap providing formulae for various command-line tools developed by [@fujiwara](https://github.com/fujiwara).

## Installation

To install tools from this tap:

```bash
# Add the tap
brew tap fujiwara/tap

# Install a specific tool
brew install <tool-name>
```

## Available Tools

This tap provides formulae for various command-line tools. See the `.rb` files in this repository for the complete list of available tools and their descriptions.

## Continuous Integration

This repository uses GitHub Actions for automated testing and updates:

- **Daily Updates**: Automatically checks for new versions of tools and creates pull requests
- **Testing**: Validates formulae by building from source on Ubuntu and macOS
- **Diff Testing**: Tests only changed formulae on pull requests

## Development

The formulae are managed using [maltmill](https://github.com/Songmu/maltmill), which automates the process of creating and updating Homebrew formulae.

### Updating a Formula

```bash
# Update a specific formula
make update/<tool-name>.rb

# Update all formulae with Linux support
make update-all

# Test a formula locally
make test/<tool-name>.rb
```

### Creating a New Formula

```bash
make create/<tool-name>
```

## License

This tap and its formulae are provided as-is for convenience in installing fujiwara's tools via Homebrew.
