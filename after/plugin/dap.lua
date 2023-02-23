local dap = require('dap')


-- Node js debugger
dap.adapters.node2 = {
	type = 'executable',
	command = 'node',
	args = {vim.fn.stdpath('data') .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js'},
}
-- Js configs (local, docker...) 
dap.configurations.javascript = {
	{
		name = 'Launch',
		type = 'node2',
		request = 'launch',
		program = '${file}',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		console = 'integratedTerminal',
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = 'Attach to process',
		type = 'node2',
		request = 'attach',
		processId = require'dap.utils'.pick_process,
	},
	{
		type= 'node2',
		request= 'attach',
		name= 'Attach to Docker',
		address= 'localhost',
		port= 5858,
		restart= true,
		sourceMaps= false,
		localRoot= '${workspaceFolder}/backend',
		remoteRoot= '/usr/jacando/backend',
		cwd = vim.fn.getcwd(),
		--sourceMapPathOverrides = {
		--	{['*'] = '${cwd}/*'}
		--},
		skipFiles = {
			"${workspaceFolder}/backend/node_modules/**/*.js",
			"<node_internals>/**/*.js"
		}
	},
}


