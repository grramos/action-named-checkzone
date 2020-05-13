# Named Checkzone

A Github action to to check the syntax and integrity of BIND-compatible zone files in a repository using `named-checkzone`. It only checks files with names starting with `db.` prefix and followed by the zone, ie. `db.example.com` stores DNS records for `example.com` zone.

## Usage

```
name: action-named-checkzone

on: [push, pull_request]

jobs:
  named-checkzone:

    runs-on: ubuntu-latest

    steps:
    - name: Check out code
      uses: actions/checkout@master
    - name: Run named-checkzone
      uses: grramos/action-named-checkzone@master
```
