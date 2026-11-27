-- Let LaTeX load the NMBU beamer theme and logos straight from the extension
-- folder, so a render leaves no copies of them next to the document.

local default_logos = { "gfx/logo-nmbu" }

-- Path from the document's folder to this extension's folder, with forward
-- slashes and a trailing slash, as \input@path and \graphicspath expect.
-- Relative, because absolute paths may contain spaces or non-ASCII characters
-- that pdflatex can't handle (e.g. OneDrive folders).
local function extension_dir()
  local doc_dir = pandoc.path.directory(quarto.doc.input_file)
  local ext_dir = pandoc.path.directory(PANDOC_SCRIPT_FILE)
  local rel = pandoc.path.make_relative(ext_dir, doc_dir, true)
  return (rel:gsub("\\", "/")) .. "/"
end

-- `logos` metadata as a list of paths. The default lives here rather than in
-- _extension.yml, because Quarto appends a document's list to the
-- extension's instead of replacing it. `logos: false` or `[]` shows none.
local function logo_paths(logos)
  if logos == nil then
    return default_logos
  end
  if logos == false then
    return {}
  end
  if pandoc.utils.type(logos) ~= "List" then
    logos = { logos }
  end
  local paths = {}
  for _, logo in ipairs(logos) do
    table.insert(paths, pandoc.utils.stringify(logo))
  end
  return paths
end

function Meta(meta)
  if not quarto.doc.is_format("beamer") then
    return nil
  end
  meta["nmbu-path"] = pandoc.RawInline("latex", extension_dir())
  local paths = logo_paths(meta.logos)
  if #paths > 0 then
    -- \providecommand, so a \logos defined in a deck's own header wins
    quarto.doc.include_text("in-header",
      "\\providecommand*{\\logos}{" .. table.concat(paths, ",") .. "}")
  end
  return meta
end
