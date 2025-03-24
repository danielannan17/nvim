vim.api.nvim_create_user_command('ProjectLint', function()
  -- Show a notification that linting has started
  local lint_msg_id = vim.notify("ESLint: Linting project...", vim.log.levels.INFO)
 
  -- Create a namespace for our ESLint diagnostics
  local namespace = vim.api.nvim_create_namespace("project_eslint")
  
  -- Clear any existing diagnostics in this namespace
  vim.diagnostic.reset(namespace)
  
  -- Run ESLint asynchronously
  local job_id = vim.fn.jobstart('npx eslint . --format json --fix 2>/dev/null', {
    stdout_buffered = true,
    on_stdout = function(_, data, _)
      if not data or #data < 2 then return end
      
      -- Parse the ESLint JSON output
      local eslint_output = table.concat(data, '\n')
      eslint_output = eslint_output:sub(eslint_output:find('\n') + 1)
      local success, results = pcall(function() 
        return vim.json.decode(eslint_output)
      end)
      
      if not success then
        vim.notify("JSON decode error: " .. tostring(results), vim.log.levels.ERROR, {
          replace = lint_msg_id
        })
        return
      end
      
      -- Track statistics for the notification
      local files_with_issues = 0
      local total_issues = 0
      
      -- Process each file's diagnostics
      for _, file_result in ipairs(results) do
        if #file_result.messages > 0 then
          files_with_issues = files_with_issues + 1
          total_issues = total_issues + #file_result.messages
          
          -- Create a buffer for the file (doesn't open it)
          local bufnr = vim.fn.bufadd(file_result.filePath)
          
          -- Convert ESLint messages to nvim diagnostics
          local diagnostics = {}
          for _, message in ipairs(file_result.messages) do
            table.insert(diagnostics, {
              lnum = message.line - 1,  -- 0-based line numbers
              col = message.column - 1, -- 0-based columns
              end_lnum = message.endLine and (message.endLine - 1) or nil,
              end_col = message.endColumn and (message.endColumn - 1) or nil,
              severity = message.severity == 2 and vim.diagnostic.severity.ERROR or vim.diagnostic.severity.WARN,
              message = message.message,
              source = "eslint",
              code = message.ruleId or "unknown",
            })
          end
          
          -- Set diagnostics for this buffer
          vim.diagnostic.set(namespace, bufnr, diagnostics)
        end
      end
      
      -- Update notification
      if total_issues > 0 then
        vim.notify("ESLint found " .. total_issues .. " issues in " .. files_with_issues .. " file(s)", 
          vim.log.levels.INFO, {
          replace = lint_msg_id
        })
        
        -- Open Telescope diagnostics picker
        vim.defer_fn(function()
          require('telescope.builtin').diagnostics({
            prompt_title = "ESLint Results",
            namespace = namespace,
          })
        end, 100)
      else
        vim.notify("No ESLint issues found", vim.log.levels.INFO, {
          replace = lint_msg_id
        })
      end
    end,
    on_stderr = function(_, data, _)
      if data and #data > 1 then
        local error_msg = table.concat(data, '\n')
        vim.notify("ESLint error: " .. error_msg, vim.log.levels.ERROR, {
          replace = lint_msg_id
        })
      end
    end,
  })
  
  if job_id <= 0 then
    vim.notify("Failed to start ESLint job", vim.log.levels.ERROR)
  end
end, {})

vim.keymap.set('n', '<leader>DD', '<cmd>ProjectLint<CR>', { desc = 'Run project-wide ESLint' })
vim.keymap.set('n', '<leader>Df', '<cmd>!npx eslint --fix 2>/dev/null %<CR>', { desc = 'Fix ESLint issues in current file' })