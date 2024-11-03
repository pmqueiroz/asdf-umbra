<div align="center">

# asdf-umbra [![Build](https://github.com/pmqueiroz/asdf-umbra/actions/workflows/build.yml/badge.svg)](https://github.com/pmqueiroz/asdf-umbra/actions/workflows/build.yml) [![Lint](https://github.com/pmqueiroz/asdf-umbra/actions/workflows/lint.yml/badge.svg)](https://github.com/pmqueiroz/asdf-umbra/actions/workflows/lint.yml)

[umbra](https://github.com/pmqueiroz/umbra) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add umbra
# or
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

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/pmqueiroz/asdf-umbra/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Pedro Queiroz](https://github.com/pmqueiroz/)
