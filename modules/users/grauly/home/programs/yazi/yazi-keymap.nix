{
  manager = {
    prepend_keymap = [
      {
        on = "<X>";
        run = "plugin xdg-mime";
      }
      {
        on = "<L>";
        run = "plugin xdg-open-with";
      }
      {
        on = "<G>";
        run = "plugin dragon";
      }
      {
        on = "<M>";
        run = "plugin mount";
      }
    ];
  };
}
