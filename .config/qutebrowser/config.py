import os

c.tabs.background = True
c.tabs.position = "top"
c.tabs.show = "multiple"

c.window.hide_decoration = True

c.auto_save.session = True

c.content.fullscreen.window = True
c.content.pdfjs = False

c.downloads.location.directory = "~/downloads/"

c.fonts.statusbar = "9pt monospace"
c.fonts.tabs.selected = "9pt monospace"
c.fonts.tabs.unselected = "9pt monospace"
c.fonts.prompts = "9pt san-serif"
c.fonts.completion.entry= "9pt monospace"

c.colors.statusbar.normal.bg = "#333"
c.colors.statusbar.url.success.https.fg = "white"
c.colors.tabs.even.fg = "#888"
c.colors.tabs.even.bg = "#333"
c.colors.tabs.odd.fg = "#888"
c.colors.tabs.odd.bg = "#333"
c.colors.tabs.selected.odd.bg = "#285577"
c.colors.tabs.selected.even.bg = "#285577"
c.colors.tabs.pinned.selected.odd.bg = "#285577"
c.colors.tabs.pinned.selected.even.bg = "#285577"
c.colors.messages.error.fg = c.colors.statusbar.normal.fg
c.colors.messages.warning.fg = c.colors.statusbar.normal.fg
c.colors.prompts.fg = c.colors.statusbar.normal.fg

c.editor.command = ['alacritty', '-e', 'nvim', '{}' ]

c.scrolling.smooth = False

c.url.default_page = "http://duckduckgo.com"
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "go": "https://pkg.go.dev/search?q={}",
    "r": "https://reddit.com/r/{}",
}

c.content.javascript.enabled = False

js_whitelist = []
whitelist_file = os.path.expanduser("~/.config/qutebrowser/js-whitelist")
with open(whitelist_file) as f:
    js_whitelist += filter(lambda l: bool(l), f.read().split("\n"))

private_whitelist = os.path.expanduser("~/.config/qutebrowser/private-whitelist")
if os.path.exists(private_whitelist):
    with open(private_whitelist) as f:
        js_whitelist += filter(lambda l: bool(l), f.read().split("\n"))

for site in js_whitelist:
    with config.pattern(site) as p:
        p.content.javascript.enabled = True

c.content.notifications: {
    'https://old.reddit.com': 'false',
    'https://www.reddit.com': 'false',
}

unbinds = ["gO"]
for key in unbinds:
    config.unbind(key)

binds = {
    'q': 'tab-close',
    ',p': 'spawn --userscript qute-pass --dmenu-invocation dmenu',
    '<Ctrl-o>': 'hint links spawn --detach mpv --force-window yes {hint-url}',
    '<Ctrl-k>': 'open-editor',
    'gF': 'spawn --userscript openfeeds',
    'gO': 'set-cmd-text :open -t {url:pretty}',
    
    'xjp': 'spawn --userscript format_json',
    "xjn": "set content.javascript.enabled true",
    "xjf": "set content.javascript.enabled false",

    'zd': 'config-cycle content.user_stylesheets ./css/darculized-all-sites.css ""',
    
    ';m': 'spawn --userscript view_in_mpv',
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
    'mpv': 'hint links spawn --detach /usr/bin/mpv --save-position-on-quit {hint-url}',
    'dlwallpaper': 'hint links spawn --detach ~/.local/bin/dlwallpaper {hint-url}',
}

c.content.host_blocking.lists = [
            "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts",
        ]
