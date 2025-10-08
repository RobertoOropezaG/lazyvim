return {
 "nvim-mini/mini.surround",
  version = false, -- always use latest
  event = "VeryLazy",
  opts = {
    -- This allows multi-character surrounds like <div>…</div>
    -- Default mappings are: gsa (add), gsd (delete), gsr (replace)
    -- Just type the full tag name, e.g. <div>, when prompted
    n_lines = 50,  -- how far to search for surroundings
  },
}
