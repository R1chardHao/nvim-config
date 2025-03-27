function string:endswith(ending)
    return ending == "" or self:sub(-#ending) == ending
end

function startDotnet()
    local cwd = vim.fn.getcwd()
    local cwdContent = vim.split(vim.fn.glob(cwd .. "/*"), '\n', {trimempty=true})
    local solutions = {}
    for _, file in pairs(cwdContent) do
        if file:endswith(".sln") then
            table.insert(solutions, file)
        end
    end
    local solutionChooseList = {"Which solution do you want to open?"}
    for i, file in pairs(solutions) do
        table.insert(solutionChooseList, i .. ". " .. file)
    end
    local choice = vim.fn.inputlist(solutionChooseList)
    if choice == nil or choice == '' then
        return
    end
    local solution = solutions[choice]
    openSolution(solution, cwd)
end

function openSolution(solution, dir)
    local lspconfig = require('lspconfig')
    lspconfig.csharp_ls.setup({
        autostart = true,
        cmd = {'csharp-ls', '--solution', solution},
        root_dir = function ()
            return dir
        end
    })
end

require('lspconfig').csharp_ls.setup({
  autostart = false,
})
vim.api.nvim_create_user_command( 'Solutions', startDotnet, {})

