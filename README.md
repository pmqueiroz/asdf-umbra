<div align="center">

# asdf-umbra [![Build](https://github.com/pmqueiroz/asdf-umbra/actions/workflows/build.yml/badge.svg)](https://github.com/pmqueiroz/asdf-umbra/actions/workflows/build.yml) 

[umbra](https://github.com/pmqueiroz/umbra) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

## Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

## Dependencies

### MacOS

* [GNU Core Utils](http://www.gnu.org/software/coreutils/coreutils.html) - `brew install coreutils`

### Linux (Debian)

* [GNU Core Utils](http://www.gnu.org/software/coreutils/coreutils.html) - `apt install coreutils`
* [curl](https://curl.haxx.se) - `apt install curl`

## Install

Plugin:

```shell
asdf plugin add umbra https://github.com/pmqueiroz/asdf-umbra.git
```

umbra:

```shell
# Show all installable versions
asdf list-all umbra

# Install specific version
asdf install umbra latest

# Set a version globally (on your ~/.tool-versions file)
asdf global umbra latest

# Now umbra commands are available
umbra --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

## Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/pmqueiroz/asdf-umbra/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Pedro Queiroz](https://github.com/pmqueiroz/)
