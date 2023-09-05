-- Attaches to every FileType mode
require 'colorizer'.setup()

-- Attach to certain Filetypes, add special configuration for `html`
-- Use `background` for everything else.
require 'colorizer'.setup {
  filetypes = {
    'css',
    'javascript',
    html = { mode = 'foreground'; }
  },
}

-- Use the `default_options` as the second parameter, which uses
-- `foreground` for every mode. This is the inverse of the previous
-- setup configuration.
require 'colorizer'.setup {
  filetypes = {
    'css',
    'javascript',
    html = { mode = 'foreground'; }
  },
  user_default_options = { mode = "background", },
}

-- Use the `default_options` as the second parameter, which uses
-- `foreground` for every mode. This is the inverse of the previous
-- setup configuration.
require 'colorizer'.setup {
  filetypes = {
    '*'; -- Highlight all files, but customize some others.
    css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
    html = { names = false; } -- Disable parsing "names" like Blue or Gray
  },
}

-- Exclude some filetypes from highlighting by using `!`
require 'colorizer'.setup {
  filetypes = {
    '*'; -- Highlight all files, but customize some others.
    '!vim'; -- Exclude vim from highlighting.
  -- Exclusion Only makes sense if '*' is specified!
  },
}

-- Alwyas update the color values in cmp_docs even if it not focused
require 'colorizer'.setup {
  filetypes = {
    '*'; -- Highlight all files, but customize some others.
    cmp_docs = {always_update = true}
  },
}
