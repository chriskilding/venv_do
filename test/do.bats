#!/usr/bin/env bats

venv_do() {
    python -m venv_do "$@"
}

@test 'should do a command' {
    run venv_do true
    [[ "$status" -eq 0 ]]
}

@test 'should do a command with multiple arguments' {
    [[ $(venv_do 'echo hello world') = "hello world" ]]
}