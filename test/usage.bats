#!/usr/bin/env bats

venv-do() {
    ./venv-do "$@"
}

@test '-h should show the usage screen' {
    run venv-do -h
    [[ "$status" -eq 1 ]]
}

@test '--help should show the usage screen' {
    run venv-do --help
    [[ "$status" -eq 1 ]]
}
