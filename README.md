# halostatue/fish-dict

[![Version][]](https://github.com/halostatue/fish-dict/releases)

Dictionary functions for [fish shell][]. These functions are based on bash 3
functionality, because fish does not yet support associative arrays.

This has been extracted from `halostatue/fish-utils-core` because these
functions are not core and should be installed on their own.

## Installation

Install with [Fisher][] (recommended):

```fish
fisher add halostatue/fish-dict # Fisher 3.x
fisher install halostatue/fish-dict # Fisher 4.0+
```

<details>
<summary>Not using a package manager?</summary>

---

Copy `functions/*.fish` to your fish configuration directory preserving the
directory structure.

</details>

### System Requirements

- [fish][] 3.0+

## Functions

### dict:\* - dict:empty, dict:get, dict:has_key, dict:keys, dict:set

Functions to give fish behaviour similar to associative arrays found in `zsh`
or bash 4. This is based on functions that I wrote for bash 3 and uses the
same technique.

```fish
dict:set x y          # sets x{y} to an empty value
dict:set x y 1        # sets x{y} to the value 1
dict:set x y 1 2 3    # sets x{y} to the list value 1 2 3
dict:get x y          # gets the value of x{y}
dict:has_key x y      # true if key y exists in dictionary x
dict:empty x          # true if there is no dictionary x
dict:keys x           # the list of all keys in dictionary x
dict:count x          # the number of keys found in dictionary x
```

## License

[MIT](LICENCE.md)

[fish shell]: https://fishshell.com 'friendly interactive shell'
[version]: https://img.shields.io/github/tag/halostatue/fish-dict.svg?label=Version
[fisher]: https://github.com/jorgebucaran/fisher
[fish]: https://github.com/fish-shell/fish-shell
