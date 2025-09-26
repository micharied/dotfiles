# The start of my nix setup 

## Fix "no space left on device" error during rebuild
```
sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system
sudo nix-collect-garbage --delete-older-than 7d
```

## Inspired by
1. https://nixos-and-flakes.thiscute.world/
2. https://github.com/haglobah/nix-home/
3. https://github.com/haglobah/mynix
4. https://github.com/kenranunderscore/dotfiles