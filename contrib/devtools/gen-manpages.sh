#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

nealcoinD=${nealcoinD:-$SRCDIR/nealcoind}
nealcoinCLI=${nealcoinCLI:-$SRCDIR/nealcoin-cli}
nealcoinTX=${nealcoinTX:-$SRCDIR/nealcoin-tx}
nealcoinQT=${nealcoinQT:-$SRCDIR/qt/nealcoin-qt}

[ ! -x $nealcoinD ] && echo "$nealcoinD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($nealcoinCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for nealcoind if --version-string is not set,
# but has different outcomes for nealcoin-qt and nealcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$nealcoinD --version | sed -n '1!p' >> footer.h2m

for cmd in $nealcoinD $nealcoinCLI $nealcoinTX $nealcoinQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
