let
  simpleProgams = [
    "blender"
    "inkscape"
    "ark"
    "gimp"
    "evince"
    "blockbench"
    "prusa-slicer"
  ];
in
{
  mgr = {
    sort_by = "mtime";
    sort_reverse = true;
    sort_dir_first = true;
    linemode = "custom";
  };
  opener = ({
    vlc = [
      {
        run = "vlc \"$@\"";
        orphan = true;
      }
    ];
    librewolf = [
      {
        run = "librewolf --new-window \"$@\"";
        orphan = true;
      }
    ];
    nvim = [
      {
        run = "nvim \"$@\"";
        block = true;
      }
    ];
  } // (
    builtins.listToAttrs (map
      (command:
        ({
          name = "${command}";
          value = [{ run = "${command} \"$@\""; orphan = true; }];
        })
      )
      simpleProgams)
  ));
  open = {
    rules = [
      { mime = "text/html"; use = [ "nvim" "librewolf" ]; }
      { name = "*.gcode"; use = "prusa-slicer"; }
      { name = "*.bgcode"; use = "prusa-slicer"; }
      { mime = "text/*"; use = "nvim"; }
      { mime = "video/*"; use = "vlc"; }
      { mime = "audio/*"; use = "vlc"; }
      { mime = "image/svg+xml"; use = [ "inkscape" "nvim" ]; }
      { mime = "image/*"; use = "gimp"; }
      { name = "*.bbmodel"; use = "blockbench"; }
      { name = "*.json"; use = [ "nvim" "blockbench" "librewolf" ]; }
      { name = "*.zip"; use = "ark"; }
      { name = "*.stl"; use = "prusa-slicer"; }
      { name = "*.pdf"; use = [ "evince" "librewolf" "gimp" ]; }
      { mime = "application/blender"; use = "blender"; }
      { mime = "*"; use = "nvim"; }
    ];
  };
}
