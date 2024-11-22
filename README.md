# Neovim: Comment Divider

This is a plugin, that allows you, to create personalized comment dividers in your code. It is
inspired by [section divider](https://marketplace.visualstudio.com/items?itemName=dinhani.divider) and [comment divider](https://marketplace.visualstudio.com/items?itemName=stackbreak.comment-divider) for Visual Studio Code.

![Comment divider example image](./docs/landing-page-image.png)

## Installation

Use your favorite plugin manager, to install this plugin. For example, with Lazy:

```lua
return {
    "Layxe/comment-divider.nvim",
    init = function()
        local comment_divider = require("comment-divider")
        comment_divider.setup({
            -- Here you can add additional comment tokens for file extensions,
            -- if they are absent from the default list. You can also overwrite
            -- existing comment tokens.
            c    = { "/*", "*/" }, -- Overwrite default // token to /* */.
            vhdl = "--", -- Add a new token for VHDL files.
        })


        local function create_section_divider()
            comment_divider.insert_divider("#", 100)
        end

        local function create_section_divider_centered_text()
            comment_divider.insert_divider_centered_text("-+-", 80)
        end

        -- Create a new textless divider with Alt+d in normal mode with # as the token until
        -- column 100.
        vim.keymap.set("n", "<A-d>", create_section_divider)

        -- Create a divider with centered text with Alt+x in insert mode with -+- as the token.
        vim.keymap.set("n", "<A-x>", create_section_divider_centered_text)

        -- Do the same for insert mode
        vim.keymap.set("i", "<A-d>", create_section_divider)
        vim.keymap.set("i", "<A-x>", create_section_divider_centered_text)
    end,
}
```
