"""
Execute commands in a one-off Python virtualenv.
"""

import sys
import shutil
import argparse
import tempfile
import venv
import subprocess


def run(command, prompt=None, with_pip=False):
    the_virtualenv = tempfile.mkdtemp()

    venv.create(the_virtualenv, prompt=prompt, with_pip=with_pip)

    # The entire point of this program is to run an arbitrary shell command in a virtualenv.
    # Therefore we must tell subprocess to run that command in a real shell.
    status = subprocess.call(str.format(". {0}/bin/activate && {1}", the_virtualenv, command),
                             stdout=sys.stdout, stderr=sys.stderr, stdin=sys.stdin, shell=True)

    shutil.rmtree(the_virtualenv, ignore_errors=True)

    sys.exit(status)


def main(args=None):
    parser = argparse.ArgumentParser(prog=__name__,
                                     description='Execute commands in a one-off Python virtualenv.')

    parser.add_argument('command',
                        help='The command to run in the one-off virtualenv.')

    parser.add_argument('--prompt',
                        help='Provides an alternative prompt prefix for '
                             'this environment.')

    parser.add_argument('--without-pip',
                        dest='with_pip',
                        default=True,
                        action='store_false',
                        help='Skips installing or upgrading pip in the '
                             'virtual environment (pip is bootstrapped '
                             'by default)')

    options = parser.parse_args(args)

    run(options.command,
        prompt=options.prompt, with_pip=options.with_pip)
