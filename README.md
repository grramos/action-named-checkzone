# Named Checkzone

A Github action to to check the syntax and integrity of zone files in a repository using `named-checkzone`. It only check files with using the naming format `db.<zone>`, for example, `db.example.com` has DNS records for `example.com` zone.

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
