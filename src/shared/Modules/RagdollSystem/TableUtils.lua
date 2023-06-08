
local TableUtils = {}

function TableUtils.filter<T>(list, filterfunction: (T) -> boolean): { T }
	local filteredlist = {}

	for _, v in list do
		if filterfunction(v) then
			table.insert(filteredlist, v)
		end
	end

	return filteredlist
end


function TableUtils.map<T, U>(list, mapfunction: (T) -> U): { U }
	local mappedList = table.create(#list)

	for k, v in list do
		mappedList[k] = mapfunction(v)
	end

	return mappedList
end

return TableUtils