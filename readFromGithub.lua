--use pastebin to get this on your turtles
local function readFromGithub(repository, programPath)
  local http = require("http")

  local function downloadProgramFromGitHub(url)
    local response = http.get(url)

    if response then
      local programCode = response.readAll()
      response.close()
      return programCode
    end

    return nil
  end

  local url = "https://raw.githubusercontent.com/" .. repository .. "/main/" .. programPath
  local programCode = downloadProgramFromGitHub(url)

  return programCode
end
print("Enter the GitHub repository: ")
local repository = read()

print("Enter the program path: ")
local programPath = read()

print("Enter the program name: ")
local programName = read()

local programCode = readFromGithub(repository, programPath)

local file = fs.open(programName .. ".lua", "w")
file.write(programCode)
file.close()

print("Program downloaded and saved successfully!")
