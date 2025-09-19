# Bazzite LDX Nvidia

Bazzite Lighter Developer Experience for owners of older NVIDIA cards that ships the exact same packages like original [Bazzite DX](https://dev.bazzite.gg/) does and it doesn't use `bazzite-deck` as a base. Also this repo may be seen as an example of manual convertion from `image-template` by [Universal Blue](https://ublue.it) to [BlueBuild](https://blue-build.org/) environment.

## Included software

* [Android platform tools](https://developer.android.com/tools) (adb, fastboot)
* [BPF Compiler Collection](https://github.com/iovisor/bcc) (`bcc`), [bpftop](https://github.com/Netflix/bpftop), [bpftrace](https://github.com/bpftrace/bpftrace)
* [BlueBuild CLI](https://github.com/blue-build/cli)
* [C/C++ Compiler cache](https://ccache.dev/) (`ccache`)
* [Docker](https://www.docker.com/) with `docker-compose` and `buildx` plugins
* [nicstat](https://sourceforge.net/projects/nicstat/)
* [numactl](https://github.com/numactl/numactl), numa support
* [Flatpak Builder](https://github.com/flatpak/flatpak-builder)
* [Podman Machine](https://docs.podman.io/en/latest/markdown/podman-machine.1.html) and [Podman Terminal UI](https://github.com/containers/podman-tui)
* [Ramalama](https://ramalama.ai/)
* [rclone](https://rclone.org/)
* [restic](https://restic.net/)
* [sysprof](https://www.sysprof.com/)
* [tiptop](https://team.inria.fr/pacap/software/tiptop/), performance monitoring tool based on hardware counters
* [QEMU KVM metapackage](https://www.qemu.org/) (for use in virt-manager flatpak after running `ujust setup-virtualization`)
* [Visual Studio Code](https://code.visualstudio.com/)
* [usbmuxd](https://www.libimobiledevice.org/), daemon for communicating with iOS devices
* [Z shell](https://www.zsh.org/)

## Installation

To rebase an existing Bazzite installation to the latest build (add `-gnome` before `-nvidia` if you're using GNOME):

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/lumaeris/bazzite-ldx-nvidia:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Before rebasing to the signed image, if you need to use Docker, execute this script:
  ```
  ujust setup-docker
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/lumaeris/bazzite-ldx-nvidia:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/lumaeris/bazzite-ldx-nvidia
cosign verify --key cosign.pub ghcr.io/lumaeris/bazzite-ldx-gnome-nvidia
```
