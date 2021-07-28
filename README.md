# venv_do

Execute a command in a one-off Python virtualenv.

## Overview

The `venv_do` module is to `venv` roughly what `sudo` is to `su`. It allows execution of a command in an ephemeral Python virtual environment (venv), which is torn down at the end of the command.

This is useful for commands that must reliably execute in a pristine Python environment each time.

## Dependencies

- [Python](https://www.python.org) 3.3+
- [Bats](https://github.com/bats-core/bats-core) (test)

## Install

    pip install venv_do

## Usage

    python -m venv_do [options] <command>

## Options

The `venv_do` module understands the following options:

- `-h, --help` Display the usage screen.
- `--prompt PROMPT` Provides an alternative prompt prefix for this environment.
- `--without-pip` Skips installing or upgrading pip in the virtual environment (pip is bootstrapped by default).


## Examples

To run a single command:

    $ python -m venv_do whoami
    joe

To run a command with arguments:

    $ python -m venv_do 'echo hello world'
    hello world

To run a command that uses Python executables, the string should be quoted to avoid the shell expanding their path:

    $ python -m venv_do 'pip install -q homebrew-pypi-poet example && poet -f example'

## Environment

All standard Python environment variables that modify the Python PATH will affect:

- The execution of `venv` in `venv_do` itself.
- The execution of Python programs in the user-supplied `<command>`.

## Exit Status

In normal circumstances, the `venv_do` module will exit with the exit status of the `<command>` that it ran.

It will exit with a non-zero status if an operation in the module itself fails.
    
## Standards

The `venv_do` module's virtualenv handling is expected to conform to the PEP-405 Python Virtual Environments standard at <https://www.python.org/dev/peps/pep-0405/>.
