{
  programs.wofi = {
    enable = true;
    settings = {
      insensitive = true;
    };
    style = ''
      * {
        font-family: "JetBrains Mono";
        background-color: transparent;
        color: white;
      }
      window {
        background-color: rgba(32,37,37,0.7);
        border-radius: 10px;
        border: 2px solid #430b9e;
      }
      #entry:selected {
        background-color: #430b9e;
        color: white;
        border: none;
      }
      scrollbar {
        backgrouncolor: #2642bf;
      }
    '';
  };
}
