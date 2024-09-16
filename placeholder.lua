-- If executor closure is not present, replaces it with a placeholder function/table/etc.
local function replaceFunc(cloj, clst, ret)
  if cloj then return end
  getgenv()[clst] = function() return ret end
end

return function(t)
  for i, v in t do
    replaceFunc(v.Expected, v.Global, v.Returned)
  end
end
