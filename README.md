## slackware-deps-helpers
Dependency resolution helper scripts for Slackware64

## Usage
1. Mount slackware DVD at `/mnt/cdrom`:
```
# mount /dev/sr0 /mnt/cdrom
```

2. Make file list database:
```bash
$ ./make-file-list.sh > filelist
```

3. Create a libs file:
```bash
$ ./find-missing-libs.sh | sort | uniq > missing-libs
```

4. Get some packages to install:
```bash
$ ./find-missing-packages.sh missing-libs filelist
```

* (Hint) To install all of them at once:
```bash
$ sudo installpkg $(./find-missing-packages.sh missing-libs filelist | cut -f2 -d'	' | sort | uniq)
```
