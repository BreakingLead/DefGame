local util = require("src.util.util")
local Object = require("src.lib.classic")
ButtonGroup = Object:extend()

function ButtonGroup:new(_button_list)
    -- Private:
    self.__button_list = {}
    self.__number = 0
    self.__pre_select_index = 1

    -- If null
    if _button_list then self.__button_list = _button_list end
end

function ButtonGroup:update(dt)
    for index, value in ipairs(self.__button_list) do
        value:update(dt)
        value.size=4
    end
    self:getButton(self.__pre_select_index).size=6
end

function ButtonGroup:draw()
    for index, value in ipairs(self.__button_list) do
        value:draw()
    end
end

function ButtonGroup:getTotalNumber()
    return #self.__button_list
end

-- If direction is 0: clear selection
-- If direction is 1: next
-- If direction is -1: last
--! Do not pass 0?
function ButtonGroup:preSelectButtonInList(direction)
    if direction == 0 then

    elseif direction == -1 then
        if self.__pre_select_index>1 then
            self.__pre_select_index=self.__pre_select_index-1
        else
            self.__pre_select_index = self:getTotalNumber()
        end
    elseif direction ==1 then
        if self.__pre_select_index<self:getTotalNumber() then
            self.__pre_select_index=self.__pre_select_index+1
        else
            self.__pre_select_index = 1
        end
    end
end

---@diagnostic disable-next-line: undefined-doc-name
---@param button Button
---@param pos integer
---@return nil
function ButtonGroup:addButton(button, pos)
    if pos then
        table.insert(self.__button_list, pos, button)
    else
        table.insert(self.__button_list, button)
    end
end

function ButtonGroup:__getButtonObjectFromName(str)
    -- Generate name->index table
    local reverse_table = {}
    for i, value in ipairs(self.__button_list) do
        reverse_table[value.name] = value
    end
    return reverse_table[str]
end

function ButtonGroup:getButton(index)
    if type(index) == "string" then
        return self.__getButtonObjectFromName(index)
    elseif type(index) == "number" then
        return self.__button_list[index]
    end
end

function ButtonGroup:useButton(index)
    if type(index)=="nil" then index = self.__pre_select_index end
    self:getButton(index).func()
end