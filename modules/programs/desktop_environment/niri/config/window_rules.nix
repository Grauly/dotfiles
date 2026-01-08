{ osConfig, ... }:

[
  { # floating rules. this will be "fun"
    matches = [
      {
        app-id = "^librewolf$";
        title = "^Picture-in-Picture$";
      }
      {
        app-id = "^vesktop$";
        title = "";
      }
    ];
    open-floating = true;
  }
  { # bc regex is wierd
    matches = [
      {
        app-id = "^vesktop$";
        title = "Vesktop";
      }
    ];
    open-floating = false;
  }
  { # corner rounding. Honestly, why here?
    geometry-corner-radius = 
      let
        radius = osConfig.grauly.style.border-radius * 1.0;
      in
      {
        bottom-left = radius;
        bottom-right = radius;
        top-left = radius;
        top-right = radius;
      };
    clip-to-geometry = true;
  }
]