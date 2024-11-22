local COMMENT_FROM_FILE_EXTENSION = require('comment-styles').COMMENT_FROM_FILE_EXTENSION

-- Private Functions
-- #################################################################################################

local function get_comment_symbols()
    local file_ending = vim.fn.expand('%:e')

    if COMMENT_FROM_FILE_EXTENSION[file_ending] then
        return COMMENT_FROM_FILE_EXTENSION[file_ending]
    end

    return '#'
end

-- Public Functions
-- #################################################################################################

--- Optionally setup additional comment symbols for file extensions.
---@param additional_comment_symbols table A table with file extensions as keys and comment symbols
---                                        as values.
local function setup(additional_comment_symbols)
    if additional_comment_symbols then
        for file_extension, comment_symbols in pairs(additional_comment_symbols) do
            COMMENT_FROM_FILE_EXTENSION[file_extension] = comment_symbols
        end
    end
end

--- Inserts a divider that will contain the previous line content in the center of the divider.
--- @param divider_char string The character sequence that will be used to create the divider
--- @param divider_end_line number The length of the divider
local function insert_divider_centered_text(divider_char, divider_end_line)
    -- Get the current line and the block comment prefix
    local line_content = vim.api.nvim_get_current_line()

    -- Trim indentation and trailing whitespaces from the line content
    line_content = line_content:match('^%s*(.-)%s*$')

    local comment_symbols = get_comment_symbols()
    local comment_prefix

    if type(comment_symbols) == 'table' then
        comment_prefix = comment_symbols
    else
        comment_prefix = {comment_symbols, comment_symbols}
    end

    -- Get the indentation of the current line
    local indent = vim.api.nvim_get_current_line():match('^%s*')

    -- Calculate the length of the divider
    local divider_length = divider_end_line - #(comment_prefix[1]) - #line_content - #(comment_prefix[2]) - #indent
    -- 2 for spaces around the line content and 2 for the comment prefix
    divider_length = divider_length - 4

    -- Create half of the comment string
    local divider_half_length = math.floor(divider_length / 2)
    local divider             = string.rep(divider_char, divider_half_length)

    -- Replicate the indentation
    local indentation_str = string.rep(' ', #indent)
    -- Create the complete comment string
    local comment_string =
        indentation_str .. comment_prefix[1] .. ' ' .. divider .. ' ' .. line_content .. ' '

    -- Fill in the missing chars until the end of the line
    local missing_chars = divider_end_line - #comment_string - #(comment_prefix[2]) - 1

    comment_string =
        comment_string .. string.rep(divider_char, missing_chars) .. ' ' .. comment_prefix[2]

    vim.api.nvim_set_current_line(comment_string)
end

--- Inserts a divider below the current line.
--- @param divider_char string The character sequence that will be used to create the divider.
--- @param divider_end_line number The length of the divider.
local function insert_divider(divider_char, divider_end_line)
    local indent         = vim.api.nvim_get_current_line():match('^%s*')
    local comment_prefix = get_comment_symbols()

    local divider

    -- If a string is passed, the language supports line comments, therefore the comment prefix is
    -- a string
    if type(comment_prefix) == 'string' then
        -- Calculate the divider length, -1 accords for the space between the comment prefix and
        -- the divider
        local divider_length = divider_end_line - #indent - #comment_prefix - 1

        if not comment_prefix then
            return
        end

        -- Insert the divider
        divider = string.rep(divider_char, divider_length)
        divider = indent .. comment_prefix .. " " .. divider
    end

    -- If a table is passed, the language only supports block comments, therefore the comment
    -- prefix is a table with two elements
    if type(comment_prefix) == 'table' then
        --- Calculate the divider length, -2 accords for the space between the comment prefix and
        --- the divider
        local divider_length =
            divider_end_line - #indent - #comment_prefix[1] - #comment_prefix[2] - 2

        if not comment_prefix then
            return
        end

        -- Insert the divider
        divider = string.rep(divider_char, divider_length)
        divider = indent .. comment_prefix[1] .. " " .. divider .. " " .. comment_prefix[2]

    end

    if divider ~= nil then
        vim.api.nvim_put({divider}, 'l', true, true)
    end

end

return {
    insert_divider               = insert_divider,
    insert_divider_centered_text = insert_divider_centered_text,
    setup                        = setup
}
