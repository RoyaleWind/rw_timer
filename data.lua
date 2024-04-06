local TimeToSeconds = function(h, m, s)
    return (3600 * h) + (60 * m) + s
end
Data = {
    core   = "ESX_LEGACY", --<< ESX_1_1 >>-<< ESX_1_2 >>-<< ESX_LEGACY >>-<< QB >>-<< ND >>--
    type   = "bank",       -- WORKS ONLY FOR ESX_1.2 ESX_LEGACY QB AND ND
    reason = "Timer",      -- WORJS ONLY QB AND ND
    time   = TimeToSeconds(3, 11, 15),
    money  = 1000,
}
