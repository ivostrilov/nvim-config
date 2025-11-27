M = {}
M.script_path = "lua/utils/jdtls_setup.lua"

java_home = "/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"

function M.setup()
  print(M.script_path .. "::setup executing...");
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function(args)
      start_or_attach()
    end
  })
end

function start_or_attach()
  local bufname = vim.api.nvim_buf_get_name(0)
  if not bufname:match("%.java$") then
    return
  end

  -- ищем корень проекта
  local root_markers = {
    "pom.xml",
    "build.gradle",
    "build.gradle.kts",
    "settings.gradle",
    "settings.gradle.kts",
    "gradlew",
    "mvnw",
    ".git"
  }

  local root_dir = require("jdtls.setup").find_root(root_markers)

  if not root_dir or root_dir == "" then
    vim.notify(
      "jdtls: root_dir not found, not starting",
      vim.log.levels.WARN
    )
    return
  end

  local jdtls = require("jdtls")

  vim.env.JAVA_HOME = vim.fn.expand(java_home)

  local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"
  local jdtls_pkg = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

  -- workspace for project
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  local workspace_dir = vim.fn.stdpath("cache") .. "/nvim/jdtls/workspace/" .. project_name

  local cmd = {
    jdtls_bin,
    "--jvm-arg=-javaagent:" .. jdtls_pkg .. "/lombok.jar",
    "-configuration",
    jdtls_pkg .. "/config_mac",  -- у тебя macOS
    "-data",
    workspace_dir,
  }

  -- For debug
  -- vim.schedule(function()
  --   vim.notify(
  --     "Starting jdtls:\n" .. table.concat(cmd, " "),
  --     vim.log.levels.INFO,
  --     { title = "jdtls cmd" }
  --   )
  -- end)

  local config = {
    cmd = cmd,
    root_dir = root_dir,
  }

  jdtls.start_or_attach(config)
end

return M
