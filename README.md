# strictbash

<img src="https://github.com/jamespwilliams/strictbash/raw/main/screenshots/shellcheck.png" width=200>

`strictbash` offers a convenient way of enabling the (unofficial) [Bash Strict
Mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/). Additionally,
it offers an easy way to run
[shellcheck](https://github.com/koalaman/shellcheck) on a script before it's
executed.

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

### Examples

```terminal
[jpw@machine ~]$ bat test.sh

───────┬────────────────────────────────────────────────────────────────────────
       │ File: test.sh
───────┼────────────────────────────────────────────────────────────────────────
   1   │ #!/usr/bin/env -S strictbash
   2   │
   3   │ echo $foo
───────┴────────────────────────────────────────────────────────────────────────
[jpw@machine ~]$ ./test.sh
./test.sh: line 3: foo: unbound variable
```

```terminal
[jpw@machine ~]$ bat test.sh
───────┬───────────────────────────────────────────────────────────────────────
       │ File: test.sh
───────┼───────────────────────────────────────────────────────────────────────
   1   │ #!/usr/bin/env -S strictbash --shellcheck
   2   │
   3   │ $foo=10
───────┴───────────────────────────────────────────────────────────────────────
[jpw@machine ~]$ ./test.sh

In ./test.sh line 3:
$foo=10
^--^ SC2034: foo appears unused. Verify use (or export if used externally).
 ^-- SC1066: Don't use $ on the left side of assignments.

For more information:
  https://www.shellcheck.net/wiki/SC1066 -- Don't use $ on the left side of a...
  https://www.shellcheck.net/wiki/SC2034 -- foo appears unused. Verify use (o...
```
