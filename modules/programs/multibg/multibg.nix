{
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "multibg-wayland";
  version = "0.2.4";

  src = fetchFromGitHub {
    owner = "gergo-salyi";
    repo = "multibg-wayland";
    tag = finalAttrs.version;
    hash = "sha256-gQcYvP5dpMxv5W4Po3G265hQUoqQJssb0aZwDktoqXk=";
  };

  cargoHash = "sha256-szhWFYhO11ZTdWQ/G1q4rUlgl9TLTQ/T5VL4UbDJBQY=";
})