{ pkgs, osConfig, ... }:

with osConfig.grauly.colors; pkgs.writeText "rofi-style.rasi" ''
  * {
      red:                         rgba ( 220, 50, 47, 90 % );
      blue:                        rgba ( 38, 139, 210, 90 % );
      text-color:                  ${text.color};
      border-color:		         ${mix};
      gradient-image:		         linear-gradient (to right, ${gradient-from}, ${gradient-to});
      prompt-color: 		         ${text.highlight};
      separatorcolor:              var(border-color);

    
      lightfg:                     rgba ( 120, 120, 120, 70 % );
      foreground:                  rgba ( 200, 200, 200, 100 % );
      normal-foreground:           var(foreground);
      alternate-normal-foreground: var(foreground);
      selected-normal-foreground:  var(lightbg);
      active-foreground:           var(blue);
      alternate-active-foreground: var(blue);
      selected-active-foreground:  var(background);
      urgent-foreground:           var(red);
      alternate-urgent-foreground: var(red);
      selected-urgent-foreground:  var(background);
    
      lightbg:                     ${background};
      background:                  ${background};
      normal-background:           transparent;
      alternate-normal-background: transparent;
      selected-normal-background:  var(lightbg);
      active-background:           var(background);
      alternate-active-background: var(lightbg);
      selected-active-background:  var(blue);
      urgent-background:           var(background);
      alternate-urgent-background: var(lightbg);
      selected-urgent-background:  var(red);
    
      background-color:            transparent;
      spacing:                     2;
  }
  element {
      padding: 1px ;
      cursor:  pointer;
      spacing: 5px ;
      border:  0;
  }
  element normal.normal {
      background-color: var(normal-background);
      text-color:       var(text-color);
  }
  element normal.urgent {
      background-color: var(urgent-background);
      text-color:       var(text-color);
  }
  element normal.active {
      background-color: var(active-background);
      text-color:       var(text-color);
  }
  element selected.normal {
      //background-color: var(selected-normal-background);
      background-image: var(gradient-image);
      text-color:       var(text-color);
  }
  element selected.urgent {
      background-color: var(selected-urgent-background);
      text-color:       var(text-color);
  }
  element selected.active {
      background-color: var(selected-active-background);
      text-color:       var(text-color);
  }
  element alternate.normal {
      background-color: var(alternate-normal-background);
      text-color:       var(text-color);
  }
  element alternate.urgent {
      background-color: var(alternate-urgent-background);
      text-color:       var(text-color);
  }
  element alternate.active {
      background-color: var(alternate-active-background);
      text-color:       var(text-color);
  }
  element-text {
      background-color: transparent;
      cursor:           inherit;
      highlight:        inherit;
      text-color:       inherit;
  }
  element-icon {
      background-color: transparent;
      size:             1.0000em ;
      cursor:           inherit;
      text-color:       inherit;
  }
  window {
      padding:          5;
      background-color: var(background);
      border:           2 solid 2 dash;
      border-color:     var(border-color);
      border-radius:    ${toString osConfig.grauly.style.border-radius};
  }
  mainbox {
      padding: 0;
      border:  0;
  }
  message {
      padding:      1px ;
      border-color: var(separatorcolor);
      border:       2px solid 0px 0px ;
  }
  textbox {
      text-color: var(text-color);
  }
  listview {
      padding:      2px 0px 0px ;
      scrollbar:    true;
      border-color: var(separatorcolor);
      spacing:      2px ;
      fixed-height: 0;
      border:       2px solid 0px 0px ;
  }
  scrollbar {
      width:        4px ;
      padding:      0;
      handle-width: 8px ;
      border:       0;
      handle-color: var(normal-foreground);
  }
  sidebar {
      border-color: var(separatorcolor);
      border:       2px dash 0px 0px ;
  }
  button {
      cursor:     pointer;
      spacing:    0;
      text-color: var(text-color);
  }
  button selected {
      background-color: var(selected-normal-background);
      text-color:       var(text-color);
  }
  num-filtered-rows {
      expand:     false;
      text-color: Gray;
  }
  num-rows {
      expand:     false;
      text-color: Gray;
  }
  textbox-num-sep {
      expand:     false;
      str:        "/";
      text-color: Gray;
  }
  inputbar {
      padding:    1px ;
      spacing:    0px ;
      text-color: var(text-color);
      children:   [ "prompt","textbox-prompt-colon","entry","num-filtered-rows","textbox-num-sep","num-rows","case-indicator" ];
  }
  case-indicator {
      spacing:    0;
      text-color: var(text-color);
  }
  entry {
      text-color:        var(text-color);
      cursor:            text;
      spacing:           0;
      placeholder-color: Gray;
      placeholder:       "Type to filter";
  }
  prompt {
      spacing:    0;
      text-color: var(prompt-color);
  }
  textbox-prompt-colon {
      margin:     0px 0.3000em 0.0000em 0.0000em ;
      expand:     false;
      str:        ":";
      text-color: inherit;
  }
''
