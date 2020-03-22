# gentoo-overlay

## Manual installation
For now, this overlay is not part of layman so registration has to be done manually.

### Clone this repository:
```
$ git clone https://github.com/shnups/gentoo-overlay.git /path/to/local/clone/shnups-overlay
```
### Create `/etc/portage/repos.conf/shnups.conf`:
``` ini
[shnups]
priority = 50
location = /path/to/local/clone/shnups-overlay
sync-type = git
sync-uri = https://github.com/shnups/gentoo-overlay.git
```
### Enable overlay
Via [eselect-repository](https://packages.gentoo.org/packages/app-eselect/eselect-repository)
```
eselect repository enable shnups
```
