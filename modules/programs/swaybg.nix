{ pkgs, ... }:

pkgs.swaybg.overrideAttrs (finalAttrs: previousAttrs: {
  patches = [
    "${pkgs.fetchurl {
      url = "https://gist.githubusercontent.com/Amchik/efb39696af45a09c2cf7777ad88d2298/raw/1fe2b37865ba9d2c4989a5b0cd522acdcc80477b/swaybg-namespace.patch";
      hash = "sha256-GfMwx5xkabQBKIxxlDJd1fQpLNAeBIvNU/YzNk8j8WE=";
    }}"
  ];
})
