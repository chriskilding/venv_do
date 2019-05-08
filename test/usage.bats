#!/usr/bin/env bats

venv_do() {
    python -m venv_do "$@"
}

@test '-h should show the usage screen' {
    run venv_do -h
    [[ "$status" -eq 0 ]]
}

@test '--help should show the usage screen' {
    run venv_do --help
    [[ "$status" -eq 0 ]]
}
