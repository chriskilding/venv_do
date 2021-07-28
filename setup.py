# -*- coding: utf-8 -*-

from setuptools import setup, find_packages


with open('README.md') as f:
    readme = f.read()

with open('LICENSE') as f:
    license = f.read()

setup(
    name='venv_do',
    version='0.0.3',
    description='Execute commands in a one-off Python virtualenv.',
    long_description=readme,
    author='Chris Kilding',
    url='https://github.com/chriskilding/venv_do',
    license=license,
    packages=find_packages(exclude=('test', 'docs'))
)
