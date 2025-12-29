{ config, ... }:

[
  { # floating rules. this will be "fun"
    matches = [
      {
        app-id = ''r#"firefox$"#'';
        title = "^Picture-in-Picture$";
      }
    ];
    open-floating = true;
  }
  { # corner rounding. Honestly, why here?
    geometry-corner-radius = config.grauly.style.corner-radius;
    clip-to-geometry = true;
  }
]