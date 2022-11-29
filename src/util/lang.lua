-- Default font set
love.graphics.setFont(FONT_MAY7)
local font = love.graphics.getFont()
local content = require("src.lang."..require("src.util.constant").language)
LANG = {}

local final_key = {}

local function dfs(x,tbl)
    for k, v in pairs(tbl) do
        if type(v) == "string" or (type(v) == "table " and type(v[2]) == "string")then
            final_key[x]=k
            LANG[table.concat(final_key,"_",1,x)] = love.graphics.newText(font,v)
        else
            final_key[x]=k
            dfs(x+1,v)
        end
    end
end

dfs(1,content)