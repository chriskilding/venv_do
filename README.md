# venv-do

Execute a command in a one-off Python virtualenv.

## Overview

The `venv-do` command does for `venv` roughly what `sudo` does for `su`. It allows execution of a command in an ephemeral Python environment, which is torn down at the end of the command.

This is useful for commands that must reliably execute in a pristine Python environment each time.

## Install

Dependencies:

- [Python](https://www.python.org)
- [Virtualenv](http://www.virtualenv.org/)
- [ShellCheck](https://github.com/koalaman/shellcheck) (test)
- [Bats](https://github.com/bats-core/bats-core) (test)

### Source

```bash
$ make
$ make test # optional
$ make install
```

### Homebrew

Coming soon.

## Usage

    venv-do <command>
    venv-do (-h | --help)
    
Read the man page for full instructions and examples:

```bash
$ man venv-do
```

## Examples

To run a single command:

    $ venv-do whoami
    joe

To run a command with arguments:

    $ venv-do 'pip install -q homebrew-pypi-poet example && poet -f example'