{
  projectRootFile = "flake.nix";
  programs.nixpkgs-fmt.enable = true;

  programs.ruff.format = true;
}
