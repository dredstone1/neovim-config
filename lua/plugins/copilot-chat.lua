return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    lazy = true,
    opts = {
        question_header = "## User ",
        answer_header = "## Copilot ",
        error_header = "## Error ",
        prompts = {
            -- Code related prompts
            Explain = "Please explain how the following code works.",
            Review = "Please review the following code and provide suggestions for improvement.",
            Tests = "Please explain how the selected code works, then generate unit tests for it.",
            Refactor = "Please refactor the following code to improve its clarity and readability.",
            FixCode = "Please fix the following code to make it work as intended.",
            FixError = "Please explain the error in the following text and provide a solution.",
            BetterNamings = "Please provide better names for the following variables and functions.",
            Documentation = "Please provide documentation for the following code.",
            SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
            SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",

            -- Text related prompts
            Summarize = "Please summarize the following text.",
            Spelling = "Please correct any grammar and spelling errors in the following text.",
            Wording = "Please improve the grammar and wording of the following text.",
            Concise = "Please rewrite the following text to make it more concise.",
        },
        auto_follow_cursor = false,
        show_help = true,
        mappings = {
            complete = {
                detail = "Use @<Tab> or /<Tab> for options.",
                insert = "<Tab>",
            },
            close = {
                normal = "q",
                insert = "<C-c>",
            },
            reset = {
                normal = "<C-x>",
                insert = "<C-x>",
            },
            submit_prompt = {
                normal = "<CR>",
                insert = "<C-CR>",
            },
            accept_diff = {
                normal = "<C-y>",
                insert = "<C-y>",
            },
            show_diff = {
                normal = "gmd",
            },
            show_system_prompt = {
                normal = "gmp",
            },
            show_user_selection = {
                normal = "gms",
            },
            show_help = {
                normal = "g?",
            },
        },
    },
    config = function(_, opts)
        local chat = require("CopilotChat")
        local select = require("CopilotChat.select")
        opts.selection = select.unnamed

        opts.prompts.Commit = {
            prompt = "Write commit message for the change with commitizen convention",
            selection = select.gitdiff,
        }
        opts.prompts.CommitStaged = {
            prompt = "Write commit message for the change with commitizen convention",
            selection = function(source)
                return select.gitdiff(source, true)
            end,
        }

        chat.setup(opts)
        require("CopilotChat.integrations.cmp").setup()

        vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
            chat.ask(args.args, { selection = select.visual })
        end, { nargs = "*", range = true })

        vim.api.nvim_create_user_command("CopilotChatInline", function(args)
            chat.ask(args.args, {
                selection = select.visual,
                window = {
                    layout = "float",
                    relative = "cursor",
                    width = 1,
                    height = 0.4,
                    row = 1,
                },
            })
        end, { nargs = "*", range = true })

        vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
            chat.ask(args.args, { selection = select.buffer })
        end, { nargs = "*", range = true })

        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "copilot-*",
            callback = function()
                vim.opt_local.relativenumber = true
                vim.opt_local.number = true

                local ft = vim.bo.filetype
                if ft == "copilot-chat" then
                    vim.bo.filetype = "markdown"
                end
            end,
        })
    end,
    keys = {
        {
            "<leader>ap",
            function()
                local actions = require("CopilotChat.actions")
                require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
            end,
            desc = "CopilotChat - Prompt actions",
        },
        {
            "<leader>ae",
            "<cmd>CopilotChatExplain<cr>",
            desc = "CopilotChat - Explain code",
        },
        {
            "<leader>at",
            "<cmd>CopilotChatTests<cr>",
            desc = "CopilotChat - Generate tests",
        },
        {
            "<leader>ar",
            "<cmd>CopilotChatReview<cr>",
            desc = "CopilotChat - Review code",
        },
        {
            "<leader>aR",
            "<cmd>CopilotChatRefactor<cr>",
            desc = "CopilotChat - Refactor code",
        },
        {
            "<leader>an",
            "<cmd>CopilotChatBetterNamings<cr>",
            desc = "CopilotChat - Better Naming",
        },
        {
            "<leader>av",
            ":CopilotChatVisual<cr>",
            desc = "CopilotChat - Open in vertical split",
        },
        {
            "<leader>ai",
            ":CopilotChatInline<cr>",
            mode = "x",
            desc = "CopilotChat - Inline chat",
        },
        {
            "<leader>am",
            "<cmd>CopilotChatCommit<cr>",
            desc = "CopilotChat - Generate commit message for all changes",
        },
        {
            "<leader>aM",
            "<cmd>CopilotChatCommitStaged<cr>",
            desc = "CopilotChat - Generate commit message for staged changes",
        },
        {
            "<leader>aq",
            function()
                local input = vim.fn.input("Quick Chat: ")
                if input ~= "" then
                    vim.cmd("CopilotChatBuffer " .. input)
                end
            end,
            desc = "CopilotChat - Quick chat",
        },
        {
            "<leader>ad",
            "<cmd>CopilotChatDebugInfo<cr>",
            desc = "CopilotChat - Debug Info"
        },
        {
            "<leader>af",
            "<cmd>CopilotChatFixDiagnostic<cr>",
            desc = "CopilotChat - Fix Diagnostic"
        },
        {
            "<leader>al",
            "<cmd>CopilotChatReset<cr>",
            desc = "CopilotChat - Clear buffer and chat history"
        },
    },
}
