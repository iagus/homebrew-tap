# homebrew-tap

Homebrew formulas for [iagus](https://github.com/iagus)'s projects.

## Usage

```sh
brew install iagus/tap/elasticurl
```

or, if you prefer to tap first:

```sh
brew tap iagus/tap
brew install elasticurl
```

## Formulas

| Formula | Description |
|---|---|
| `elasticurl` | Tiny Rust CLI for everyday Elasticsearch requests |

## Maintenance

To update a formula for a new upstream release (example: `elasticurl` → `v0.2.0`):

1. Compute the new tarball checksum:

   ```sh
   curl -sL https://github.com/iagus/elasticurl/archive/refs/tags/v0.2.0.tar.gz | shasum -a 256
   ```

2. Edit `Formula/elasticurl.rb`: update the tag in `url` and paste the new
   `sha256`.

3. (Optional but recommended) verify locally:

   ```sh
   brew uninstall --ignore-dependencies elasticurl
   brew install --build-from-source ./Formula/elasticurl.rb
   brew test elasticurl
   brew audit --strict elasticurl
   ```

4. Commit and push. Users pick up the new version with
   `brew update && brew upgrade`.
