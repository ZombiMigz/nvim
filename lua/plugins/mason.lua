-- lua/plugins/dynamic-venv-pyright.lua
return {
  {
    "mason-org/mason.nvim",
    config = function(_, opts)
      require("mason").setup(opts)

      local function find_venv()
        local cwd = vim.fn.getcwd()
        local venv_names = { ".venv", "venv", "env" }

        local function search(dir, depth)
          if depth <= 0 then
            return nil
          end

          local handle = vim.loop.fs_scandir(dir)
          if not handle then
            return nil
          end

          while true do
            local name, type = vim.loop.fs_scandir_next(handle)
            if not name then
              break
            end

            if type == "directory" then
              for _, venv_name in ipairs(venv_names) do
                if name == venv_name then
                  local venv_path = dir .. "/" .. name
                  local python_path = venv_path .. "/bin/python"
                  if vim.fn.filereadable(python_path) == 1 then
                    return venv_path
                  end
                end
              end

              local found = search(dir .. "/" .. name, depth - 1)
              if found then
                return found
              end
            end
          end
          return nil
        end

        return search(cwd, 3)
      end

      -- Activate venv if found
      local venv_path = find_venv()
      if venv_path then
        vim.env.VIRTUAL_ENV = venv_path
        vim.env.PATH = venv_path .. "/bin:" .. vim.env.PATH
      end
    end,
  },
}
