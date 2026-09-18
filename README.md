# Homebrew tap

Native command-line tools maintained by Yves-Laurent Creton.

## CretSpec

Prepare a complete development workspace from its specification.

```sh
brew install yveslaurentcreton/tap/cretspec
cspec --version
```

Supports macOS on Apple silicon and Intel. Git is installed as a dependency; Rust is not required.

```sh
brew update
brew upgrade yveslaurentcreton/tap/cretspec
```

To remove it, run `brew uninstall yveslaurentcreton/tap/cretspec`.

[Documentation](https://yveslaurentcreton.github.io/CretSpec/) · [Source and releases](https://github.com/yveslaurentcreton/CretSpec)

## Maintenance

The update workflow checks the latest stable release daily and on manual dispatch. It verifies the release archives against `SHA256SUMS`, tests the candidate formula on Apple silicon and Intel macOS, then commits the verified update. It uses this repository's built-in Actions token. No personal token is required.

Pull requests run the same installation tests. A failed check prevents an automatic update.
