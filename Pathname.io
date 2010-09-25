Pathname := Object clone do (
  path := nil
)

Pathname do (
	with := method(pathName,
		self path = pathName
		return self
	)
	
	+ := method(addedPath,
		Pathname clone for(path .. addedPath)
	)
	
	setPath := method(pathName,
		path = pathName
	)
	
	toString := method(return path)
	
	isFile := method(
		asFile isRegularFile
	)
	
	asFile := method(
		return File clone setPath(path)
	)
	
	list("baseName", "exists", "contents", "create", "isDirectory", "isLink", 
		"isUserExecutable", "name", "parentDirectory"
	) foreach(slotName,
		setSlot(slotName, method(
			call delegateTo(asFile)
		))
	)
)
