#!/usr/bin/env bats

venv-do() {
    ./venv-do "$@"
}

@test 'should do a command' {
    run venv-do true
    [[ "$status" -eq 0 ]]
}

@test 'should do a command with multiple arguments' {
    [[ $(venv-do echo hello world) = "hello world" ]]
}