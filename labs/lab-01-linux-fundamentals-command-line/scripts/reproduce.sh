#!/usr/bin/env bash
# Linux for Cybersecurity | Lab 01 reproducibility script
# Scope: read-only Linux inspection and temporary, synthetic lab data.
set -euo pipefail
export LC_ALL=C

lab_dir="$(mktemp -d /tmp/linux-cyber-lab01.XXXXXXXX)"
cleanup() { rm -rf -- "$lab_dir"; }
trap cleanup EXIT

section() { printf '\n=== %s ===\n' "$1"; }

section "OS and kernel"
cat /etc/os-release
uname -r
printf 'virtualization: '; systemd-detect-virt || true
printf 'root filesystem: '; findmnt -n -o SOURCE,FSTYPE /
printf 'shell: '; getent passwd "$(id -un)" | cut -d: -f7

section "Filesystem and command resolution"
pwd
type pwd
type ls
file /etc/passwd /bin/ls /dev/null
head -n 5 /etc/os-release
tail -n 3 /etc/os-release

section "File management inside a dedicated temp directory"
mkdir "$lab_dir/src" "$lab_dir/out"
printf 'sample\n' > "$lab_dir/src/input.txt"
cp "$lab_dir/src/input.txt" "$lab_dir/out/copied.txt"
mv "$lab_dir/out/copied.txt" "$lab_dir/out/renamed.txt"
diff "$lab_dir/src/input.txt" "$lab_dir/out/renamed.txt"
ls -l "$lab_dir/src" "$lab_dir/out"

section "Find: limited traversals and no deletion"
find /etc -maxdepth 1 -type f -name '*.conf' -print | head -n 10 || true
find "$lab_dir" -type f -name '*.txt' -print
find "$lab_dir" -type f -size +1c -print

section "BRE and ERE patterns"
printf 'ac\nabc\nabbc\naxc\n' | grep '^ab*c$'
printf 'ERROR login\nWARN disk\nINFO boot\n' | grep -E '^(ERROR|WARN)'
printf 'id=7\nid=42\nid=1234\nid=12345\n' | grep -E '^id=[0-9]{2,4}$'

section "grep: options using synthetic data"
printf 'ERROR\nINFO\nERROR\nWARN\n' | grep -c 'ERROR'
printf 'error\nERROR\nError\nINFO\n' | grep -i 'error'
printf 'ERROR\nINFO\nWARN\n' | grep -v 'ERROR'
printf 'error\nerrors\nmyerror\n' | grep -w 'error'
printf 'INFO inicio\nWARN disco\nERROR acceso\n' | grep -e WARN -e ERROR

section "sed: stream transformation"
printf 'localhost localhost\n' | sed 's/localhost/myhost/'
printf 'localhost localhost\n' | sed 's/localhost/myhost/g'
printf 'user123\nuser456\nadmin\n' | sed -r 's/[0-9]+/X/g'
printf 'amigo\nenemy\nvecino\n' | sed '/enemy/d'
printf 'localhost\n' | sed '/localhost/a\new line'
printf 'localhost\n' | sed '/localhost/i\new line'

section "sed: -f and -i ONLY against scratch files"
printf 'localhost\nlocalhost\n' > "$lab_dir/hosts.txt"
printf 's/localhost/myhost/g\n' > "$lab_dir/rules.sed"
sed -f "$lab_dir/rules.sed" "$lab_dir/hosts.txt"
sed -i 's/localhost/myhost/g' "$lab_dir/hosts.txt"
grep -c '^myhost$' "$lab_dir/hosts.txt"

section "tar: archive, enumerate, extract, compare"
tar -cf "$lab_dir/bundle.tar" -C "$lab_dir/src" .
tar -tf "$lab_dir/bundle.tar"
tar -xf "$lab_dir/bundle.tar" -C "$lab_dir/out"
diff "$lab_dir/src/input.txt" "$lab_dir/out/input.txt"
printf 'TAR bytes: '; wc -c < "$lab_dir/bundle.tar"

section "Completed — temporary files will be removed"
