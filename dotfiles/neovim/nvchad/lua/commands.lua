local create_cmd = vim.api.nvim_create_user_command

create_cmd("EnableVenn", function()
  require("packer").loader "venn.nvim"
  require("plugins.venn").toggle_maps()
end, {})
