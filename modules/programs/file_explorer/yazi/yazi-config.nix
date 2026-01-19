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
    linemode = "mtime";
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
      { url = "*.gcode"; use = "prusa-slicer"; }
      { url = "*.bgcode"; use = "prusa-slicer"; }
      { mime = "text/*"; use = "nvim"; }
      { mime = "video/*"; use = "vlc"; }
      { mime = "audio/*"; use = "vlc"; }
      { mime = "image/svg+xml"; use = [ "inkscape" "nvim" ]; }
      { mime = "image/*"; use = "gimp"; }
      { url = "*.bbmodel"; use = "blockbench"; }
      { url = "*.json"; use = [ "nvim" "blockbench" "librewolf" ]; }
      { url = "*.zip"; use = "ark"; }
      { url = "*.stl"; use = "prusa-slicer"; }
      { url = "*.pdf"; use = [ "evince" "librewolf" "gimp" ]; }
      { url = "*.blend"; use = "blender"; }
      { mime = "*"; use = "nvim"; }
    ];
  };
}
