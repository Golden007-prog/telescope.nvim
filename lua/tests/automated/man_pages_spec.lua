local make_entry = require "telescope.make_entry"

describe("man page entries", function()
  local entry_maker = make_entry.gen_from_apropos { sections = { "3" } }

  it("matches every name displayed for a shared man page", function()
    local entry = entry_maker "pclose(3), popen(3)      - process I/O"

    assert.are.equal("pclose(3), popen(3)", entry.ordinal)
    assert.are.equal("pclose", entry.value)
    assert.are.equal("3", entry.section)
  end)

  it("preserves the command name for a single-name man page", function()
    local entry = entry_maker "popen (3)            - pipe stream to or from a process"

    assert.are.equal("popen (3)", entry.ordinal)
    assert.are.equal("popen", entry.value)
  end)
end)
