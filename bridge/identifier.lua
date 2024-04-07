Get_Identifier = function(pid)
    if pid == nil then return nil end
    local data = nil
    for k, v in pairs(GetPlayerIdentifiers(pid)) do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            data = v
        end
    end
    return data
end
