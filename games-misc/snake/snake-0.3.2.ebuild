# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.14.0

EAPI=8

CRATES="
	c2-chacha@0.2.2
	cfg-if@0.1.9
	crossterm_input@0.3.9
	crossterm_screen@0.2.5
	crossterm_utils@0.2.4
	crossterm_winapi@0.1.5
	getrandom@0.1.10
	home@0.5.11
	kernel32-sys@0.2.2
	lazy_static@1.3.0
	libc@0.2.62
	ppv-lite86@0.2.5
	rand@0.7.0
	rand_chacha@0.2.1
	rand_core@0.5.0
	rand_hc@0.2.0
	term_size@0.3.1
	wasi@0.5.0
	winapi-build@0.1.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.2.8
	winapi@0.3.7
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
"

inherit cargo

DESCRIPTION="A simple light-weight terminal snake game"
HOMEPAGE="https://github.com/PonasKovas/snake"
SRC_URI="
	https://github.com/PonasKovas/snake/archive/refs/tags/${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0-with-LLVM-exceptions" # (Also MIT)
SLOT="0"
KEYWORDS="~amd64"
IUSE="+bell"

# Chosen based on first version released after snake. Older versions may work.
# TODO: find actual required version with cargo-msrv
RUST_MIN_VERSION="1.70.0"

PATCHES=( "${FILESDIR}/snake-0.3.2-unused-import.patch" )

src_prepare () {
	default
	if ! use bell; then
		eapply "${FILESDIR}/snake-0.3.2-no-bell.patch"
	fi
}
src_compile() {
	cargo_src_compile
}

src_install () {
	dobin target/release/snake
}
