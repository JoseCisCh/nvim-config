local dap = require('dap')

--[[dap.adapters.java = function(callback, config)
    M.execute_command({command = 'vscode.java.startDebugSession'}, function(err0, port)
        assert(not err0, vim.inspect(err0))
        callback({ type = 'server'; host = '127.0.0.1'; port = port; })
    end)
end--]]
