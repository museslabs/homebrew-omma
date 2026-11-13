# homebrew-omma

Homebrew tap for [omma](https://github.com/museslabs/omma), an eye-strain break reminder for the macOS menu bar.

## Install

```bash
brew install museslabs/omma/omma
```

Or tap first:

```bash
brew tap museslabs/omma
brew install omma
```

To start omma at login:

```bash
brew services start omma
```

## Platform support

| Platform                    | Status        |
| --------------------------- | ------------- |
| macOS 26+ (Apple Silicon)   | supported     |
| macOS (Intel), older macOS  | not supported |
| Linux                       | not supported |

omma needs macOS 26 for its Liquid Glass windows, and releases build for Apple silicon only.

## Bumping the formula

After a new `omma` release is published, its `.sha256` asset holds the hash:

```bash
V=0.2.0  # new version, no leading v
curl -fsSL "https://github.com/museslabs/omma/releases/download/v$V/omma-v$V-aarch64-apple-darwin.tar.gz.sha256"
```

Edit `Formula/omma.rb`: update the `url` and the `sha256`. Homebrew reads the version from the URL. Then:

```bash
brew audit --strict --new Formula/omma.rb
brew install --build-from-source Formula/omma.rb
brew test omma
```

Commit, push, done.
