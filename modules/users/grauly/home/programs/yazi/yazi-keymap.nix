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
      {
        on = "<z>";
        run = "plugin zoxide";
        desc = "Jump to a directory via zoxide";
      }
      {
        on = "<Z>";
        run = "plugin fzf";
        desc = "Jump to a file/directory via fzf";
      }
    ];
  };
}
