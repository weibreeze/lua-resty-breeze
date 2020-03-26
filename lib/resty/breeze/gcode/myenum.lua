-- Generated by breeze-generator (https://github.com/weibreeze/breeze-generator)
-- Schema: zj_testmsg.breeze
-- Date: 2020/3/20

local brz_w = require "resty.breeze.writer"
local brz_tools = require "resty.breeze.tools"
local brz_schema = require "resty.breeze.schema"
local brz_field_desc = require "resty.breeze.field_desc"

local _M = {_VERSION = "0.0.1"}
local _M_mt = {__index = _M}

local E1 = 1
local E2 = 2
local E3 = 3

function _M.new(self, enum_value)
    assert(type(enum_value) == "number", "enum number must be integer")
    local _m_schema = brz_schema:new('idevzTestMessage.MyEnum')

    _m_schema:put_field(brz_field_desc(1, 'enumNumber', "int32"))

    brz_tools:get_schema_seeker():add_schema('idevzTestMessage.MyEnum', _m_schema)

    local _M_t = {
        _schema = _m_schema,
        enumNumber = enum_value or 0
    }
    return setmetatable(_M_t, _M_mt)
end

function _M.value(self)
    return self.enumNumber
end

function _M.is_breeze_msg(self)
    return true
end

function _M.get_name(self)
    return self._schema:get_name()
end

function _M.write_to(self, buf)
    return brz_w.write_msg_without_type(buf, function(fbuf)
        brz_w.write_int32_field(fbuf, 1, self.enumNumber)
    end)
end

return _M