#!/bin/bash

#-------------------------------------------------------------------
# Extract tar if we have it or
# Generate wget-list and download source to /mnt/lfs/sources

# Extract tar if it exists
if [ -f "./lfshostsrc.tar" ]; then
	echo "Extracting lfshostsrc.tar..."

	tar -xf ./lfshostsrc.tar -C /mnt/lfs

	echo "Done."


	exit
fi

# Generate wget-list

mkdir /mnt/lfs/sources

cat > /mnt/lfs/sources/wget-list << "EOF"
https://download.savannah.gnu.org/releases/acl/acl-2.3.1.tar.xz
https://download.savannah.gnu.org/releases/attr/attr-2.5.1.tar.gz
https://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz
https://ftp.gnu.org/gnu/automake/automake-1.16.4.tar.xz
https://ftp.gnu.org/gnu/bash/bash-5.1.8.tar.gz
https://github.com/gavinhoward/bc/releases/download/5.0.0/bc-5.0.0.tar.xz
https://ftp.gnu.org/gnu/binutils/binutils-2.37.tar.xz
https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz
https://www.sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz
https://github.com/libcheck/check/releases/download/0.15.2/check-0.15.2.tar.gz
https://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz
https://dbus.freedesktop.org/releases/dbus/dbus-1.12.20.tar.gz
https://ftp.gnu.org/gnu/dejagnu/dejagnu-1.6.3.tar.gz
https://ftp.gnu.org/gnu/diffutils/diffutils-3.8.tar.xz
https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.46.4/e2fsprogs-1.46.4.tar.gz
https://sourceware.org/ftp/elfutils/0.185/elfutils-0.185.tar.bz2
https://dev.gentoo.org/~blueness/eudev/eudev-3.2.10.tar.gz
https://prdownloads.sourceforge.net/expat/expat-2.4.1.tar.xz
https://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz
https://astron.com/pub/file/file-5.40.tar.gz
https://ftp.gnu.org/gnu/findutils/findutils-4.8.0.tar.xz
https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz
https://ftp.gnu.org/gnu/gawk/gawk-5.1.0.tar.xz
https://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz
https://ftp.gnu.org/gnu/gdbm/gdbm-1.20.tar.gz
https://ftp.gnu.org/gnu/gettext/gettext-0.21.tar.xz
https://ftp.gnu.org/gnu/glibc/glibc-2.34.tar.xz
https://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.xz
https://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz
https://ftp.gnu.org/gnu/grep/grep-3.7.tar.xz
https://ftp.gnu.org/gnu/groff/groff-1.22.4.tar.gz
https://ftp.gnu.org/gnu/grub/grub-2.06.tar.xz
https://ftp.gnu.org/gnu/gzip/gzip-1.10.tar.xz
https://github.com/Mic92/iana-etc/releases/download/20210611/iana-etc-20210611.tar.gz
https://ftp.gnu.org/gnu/inetutils/inetutils-2.1.tar.xz
https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz
https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.13.0.tar.xz
https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-3.0.1.tar.gz
https://www.kernel.org/pub/linux/utils/kbd/kbd-2.4.0.tar.xz
https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-29.tar.xz
https://www.greenwoodsoftware.com/less/less-590.tar.gz
https://www.linuxfromscratch.org/lfs/downloads/11.0/lfs-bootscripts-20210608.tar.xz
https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.53.tar.xz
https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz
https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.3.tar.gz
https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz
https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.13.12.tar.xz
https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz
https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
https://download.savannah.gnu.org/releases/man-db/man-db-2.9.4.tar.xz
https://www.kernel.org/pub/linux/docs/man-pages/man-pages-5.13.tar.xz
https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-2.0.1.tar.gz
https://github.com/mesonbuild/meson/releases/download/0.59.1/meson-0.59.1.tar.gz
https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz
https://www.mpfr.org/mpfr-4.1.0/mpfr-4.1.0.tar.xz
https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz
https://github.com/ninja-build/ninja/archive/v1.10.2/ninja-1.10.2.tar.gz
https://www.openssl.org/source/openssl-1.1.1l.tar.gz
https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz
https://www.cpan.org/src/5.0/perl-5.34.0.tar.xz
https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.17.tar.xz
https://sourceforge.net/projects/psmisc/files/psmisc/psmisc-23.4.tar.xz
https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tar.xz
https://www.python.org/ftp/python/doc/3.9.6/python-3.9.6-docs-html.tar.bz2
https://ftp.gnu.org/gnu/readline/readline-8.1.tar.gz
https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz
https://github.com/shadow-maint/shadow/releases/download/v4.9/shadow-4.9.tar.xz
https://www.infodrom.org/projects/sysklogd/download/sysklogd-1.5.1.tar.gz
https://github.com/systemd/systemd/archive/v249/systemd-249.tar.gz
https://anduin.linuxfromscratch.org/LFS/systemd-man-pages-249.tar.xz
https://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.99.tar.xz
https://ftp.gnu.org/gnu/tar/tar-1.34.tar.xz
https://downloads.sourceforge.net/tcl/tcl8.6.11-src.tar.gz
https://downloads.sourceforge.net/tcl/tcl8.6.11-html.tar.gz
https://ftp.gnu.org/gnu/texinfo/texinfo-6.8.tar.xz
https://www.iana.org/time-zones/repository/releases/tzdata2021a.tar.gz
https://anduin.linuxfromscratch.org/LFS/udev-lfs-20171102.tar.xz
https://www.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.2.tar.xz
https://anduin.linuxfromscratch.org/LFS/vim-8.2.3337.tar.gz
https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.46.tar.gz
https://tukaani.org/xz/xz-5.2.5.tar.xz
https://zlib.net/zlib-1.2.11.tar.xz
https://github.com/facebook/zstd/releases/download/v1.5.0/zstd-1.5.0.tar.gz
https://www.linuxfromscratch.org/patches/lfs/11.0/binutils-2.37-upstream_fix-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.0/bzip2-1.0.8-install_docs-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.0/coreutils-8.32-i18n-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.0/glibc-2.34-fhs-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.0/kbd-2.4.0-backspace-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.0/perl-5.34.0-upstream_fixes-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.0/sysvinit-2.99-consolidated-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.0/systemd-249-upstream_fixes-1.patch
https://www.sudo.ws/dist/sudo-1.9.7p2.tar.gz
http://xmlsoft.org/sources/libxml2-2.9.12.tar.gz
https://www.w3.org/XML/Test/xmlts20130923.tar.gz
https://github.com/docbook/xslt10-stylesheets/releases/download/release/1.79.2/docbook-xsl-nons-1.79.2.tar.bz2
https://www.linuxfromscratch.org/patches/blfs/11.0/docbook-xsl-nons-1.79.2-stack_fix-1.patch
https://github.com/docbook/xslt10-stylesheets/releases/download/release/1.79.2/docbook-xsl-doc-1.79.2.tar.bz2
http://xmlsoft.org/sources/libxslt-1.1.34.tar.gz
https://www.kernel.org/pub/software/utils/pciutils/pciutils-3.7.0.tar.xz
https://anduin.linuxfromscratch.org/BLFS/blfs-bootscripts/blfs-bootscripts-20210826.tar.xz
https://sourceware.org/ftp/docbook-tools/new-trials/SOURCES/sgml-common-0.6.3.tgz
https://www.linuxfromscratch.org/patches/blfs/11.0/sgml-common-0.6.3-manpage-1.patch
https://downloads.sourceforge.net/infozip/unzip60.tar.gz
https://www.linuxfromscratch.org/patches/blfs/11.0/unzip-6.0-consolidated_fixes-1.patch
https://www.docbook.org/xml/4.5/docbook-xml-4.5.zip
https://curl.se/download/curl-7.78.0.tar.xz
https://www.kernel.org/pub/software/scm/git/git-2.33.0.tar.xz
https://www.kernel.org/pub/software/scm/git/git-manpages-2.33.0.tar.xz
https://www.kernel.org/pub/software/scm/git/git-htmldocs-2.33.0.tar.xz
https://ftp.debian.org/debian/pool/main/liba/libaio/libaio_0.3.112.orig.tar.xz
https://sourceware.org/ftp/lvm2/LVM2.2.03.13.tgz
https://ftp.gnu.org/gnu/parted/parted-3.4.tar.xz
https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.bz2
https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.17.0.tar.gz
https://github.com/p11-glue/p11-kit/releases/download/0.24.0/p11-kit-0.24.0.tar.xz
https://ftp.gnu.org/gnu/wget/wget-1.21.1.tar.gz
https://github.com/thom311/libnl/releases/download/libnl3_5_0/libnl-3.5.0.tar.gz
https://github.com/thom311/libnl/releases/download/libnl3_5_0/libnl-doc-3.5.0.tar.gz
https://ftp.isc.org/isc/dhcp/4.4.2-P1/dhcp-4.4.2-P1.tar.gz
https://w1.fi/releases/wpa_supplicant-2.9.tar.gz
https://github.com/djlucas/make-ca/releases/download/v1.7/make-ca-1.7.tar.xz

EOF

pushd /mnt/lfs/sources
wget -i wget-list
popd

echo "Done."

# END script
#-------------------------------------------------------------------