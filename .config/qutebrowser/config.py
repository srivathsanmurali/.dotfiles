#!/usr/bin/env python3

c.tabs.background = True
c.tabs.position = "top"
c.tabs.show = "multiple"

c.window.hide_decoration = True

c.auto_save.session = True

c.content.fullscreen.window = True
c.content.pdfjs = True

c.fonts.statusbar = "9pt monospace"
c.fonts.tabs = "9pt monospace"
c.fonts.prompts = "9pt san-serif"
c.fonts.completion.entry= "9pt monospace"

c.editor.command = ['alacritty', '-e', 'nvim', '{}' ]

c.scrolling.smooth = False

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "go": "https://pkg.go.dev/search?q={}",
    "r": "https://reddit.com/r/{}",
}

c.content.javascript.enabled = True

c.content.notifications: {
    'https://old.reddit.com': 'false',
    'https://www.reddit.com': 'false',
}

binds = {
    '<Ctrl-o>': 'hint links spawn --detach mpv --force-window yes {hint-url}',
    'gF': 'spawn --userscript openfeeds',
    'yl': 'hint links yank',
    'jq': 'spawn --userscript format_json',
    'q': 'tab-close',
}

for key, value in binds.items():
    config.bind(key, value)

c.aliases = {
    'q': 'close',
    'qa': 'quit',
    'w': 'session-save',
    'wq': 'quit --save',
    'wqa': 'quit --save',
    'jq': 'spawn --userscript format_json',
    'yt_playlist': 'hint links spawn --detach ~/.local/bin/track_yt_playlist {hint-url}',
}
