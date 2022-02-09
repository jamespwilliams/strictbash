# strictbash

`strictbash` offers a convenient way of enabling the (unofficial) [Bash Strict
Mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/).

Also, with one flag, `strictbash` allows you to pass your script through
[shellcheck](https://github.com/koalaman/shellcheck) before it's run.

<p align="center">
<img src="https://github.com/jamespwilliams/strictbash/raw/main/screenshots/no-options.png" width=400>
<p align="center"><i>Default strictbash usage</i></p>
</p>

## Usage

Using `strictbash` is straightforward: simply use the following shebang:

```bash
#!/usr/bin/env strictbash
```

This is equivalent to:

```bash
#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
```

To additionally run `shellcheck` before your script is invoked:

```bash
#!/usr/bin/env -S strictbash --shellcheck
```

To disable setting the IFS to `\n\t`, pass `--no-ifs`:

```bash
#!/usr/bin/env -S strictbash --no-ifs
```

<p align="center">
<img src="https://github.com/jamespwilliams/strictbash/raw/main/screenshots/shellcheck.png" width=700>
<p align="center"><i>Strictbash being used with the shellcheck option</i></p>
</p>

## Installation

`strictbash` is a single bash script with no dependencies (unless you want to
use its shellcheck feature, in which case you must install
[shellcheck](https://github.com/koalaman/shellcheck)). Install
by:

```bash
curl -O https://raw.githubusercontent.com/jamespwilliams/strictbash/main/strictbash
# move somewhere on your $PATH
```

If you have Nix (and [flakes
enabled](https://nixos.wiki/wiki/Flakes#Installing_flakes)), you can try it out
with:

```
nix shell github:jamespwilliams/strictbash
```

or install with

```
nix profile install github:jamespwilliams/strictbash
```

## Test file

Here's a file you can paste somewhere as a test:

```bash
#!/usr/bin/env -S strictbash --shellcheck

echo $undefined
```
