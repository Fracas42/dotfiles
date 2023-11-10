# Fracas nix configuration

Nixos configuration using home-manager.

# Installation

## Nixos environment

On a nixos machine:

Clone this repo in `~/.config/home-manager`

Make sure you `/etc/nixos/hardware-configuration.nix` is correctly setup.

Run:

```bash
$ ./os-update
```

## Home-manager environment

Make sure home-manager is installed.

Run:
```bash
$ home-manager switch
```

# Update

Start by updating the nix flake lock:
```bash
$ nix flake update
```

Or update a specific channel (just nix-vscode-extensions per exemple):
```bash
$ nix flake lock --update-input nix-vscode-extensions
```

Then, to update the system environment, only `./os-update` is needed.
As for update the home-manager environment: `home-manager switch`.

# Credits

* [baptnix](https://github.com/baptman21/baptnix)