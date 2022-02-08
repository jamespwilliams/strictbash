# strictbash

`strictbash` offers a convenient way of enabling the (unofficial) [Bash Strict
Mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/). Additionally,
it offers an easy way to run
[shellcheck](https://github.com/koalaman/shellcheck) on a script before it's
executed.

<p align="center">
<img src="https://github.com/jamespwilliams/strictbash/raw/main/screenshots/no-options.png" width=400>
<p align="center"><i>Default strictbash usage</i></p>
</p>

Using `strictbash` is straightforward: simply use the following shebang:

```bash
#!/usr/bin/env strictbash
```

or, to enable shellcheck:

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
