# My personal Gentoo Overlay

Contains .ebuild files for packages I use.
I try to write them well but

## Installation

### 1. Add the overlay to Portage

Install git

```
root # emerge --ask dev-vcs/git
```

#### Method 1:

```ini
[celer]
location = /var/db/repos/celer
sync-type = git
sync-uri = https://github.com/Ce1er/ebuild-repo.git
```

#### Method 2:

```
root # eselect repository add celer git https://github.com/Ce1er/ebuild-repo.git
```

### 2. Installing packages

All packages in this repository use the ~amd64 keyword.
This means you have to add an entry for them in [package.accept_keywords](https://wiki.gentoo.org/wiki//etc/portage/package.accept_keywords).

Examples:

```
# Allow all games-misc/snake versions
games-misc/snake ~amd64

# Allow specific version
=games-misc/snake-0.3.2 ~amd64

# Allow all packages in this repo
*/*::celer ~amd64

# For more examples consult the gentoo wiki
```

Then you can install as you would with any other package:

```
root # emerge --sync
root # emerge -av games-misc/snake
```
