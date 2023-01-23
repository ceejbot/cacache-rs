# Run tests with cargo nextest.
test:
    cargo nextest run

# Generate a changelog with git-cliff
@changelog TAG:
    git-cliff --prepend CHANGELOG.md -u --tag {{TAG}}

# Prepare a release
@release TAG:
    cargo release --workspace  {{TAG}}

# Install workspace tools
@install-tools:
    cargo install cargo-nextest
    cargo install cargo-release
    cargo install git-cliff

# Lint and automatically fix what we can fix
@lint:
    cargo clippy --fix --allow-dirty --allow-staged
    cargo fmt
