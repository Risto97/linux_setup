import os

def bind_chained(key, *commands):
    config.bind(key, ' ;; '.join(commands))

c.tabs.background = True
c.tabs.position = 'top'
c.tabs.show = 'always'
c.tabs.padding = {"bottom": 5, "left": 5, "right": 5, "top": 5}
c.tabs.favicons.scale = 1.3

c.confirm_quit = ["always"]

c.colors.tabs.selected.odd.fg = "red"
c.colors.tabs.selected.even.fg = "red"
c.colors.tabs.selected.odd.bg = "#7ea5d9"
c.colors.tabs.selected.even.bg = "#7ea5d9"
c.colors.tabs.even.bg = "darkgrey"
c.colors.tabs.odd.bg = "#8c8c8c"
c.colors.tabs.odd.fg = "black"
c.colors.tabs.even.fg = "black"

c.tabs.title.format = "{audio}{current_title}"
c.tabs.indicator.width = 0

c.input.spatial_navigation = False

c.url.start_pages = 'www.google.com'
c.url.searchengines = {
    "DEFAULT": "https://www.google.com/search?q={}",
    "g": "https://www.google.com/search?q={}",
    "sp": "https://www.startpage.com/do/dsearch?query={}",
    "r": "https://reddit.com/r/{}",
    "gt": "https://translate.google.com/#auto/en/{}",
    "gh": "https://github.com/search?q={}",
    "aur": "https://aur.archlinux.org/packages/?K={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "maps": "https://www.google.com/maps?q={}"
}
c.url.default_page = 'www.google.com'
# Bindings for normal mode

config.bind('m', 'spawn --detach mpv --geometry=75% {url}')
config.bind('M', 'hint links spawn --detach mpv --geometry=75% {hint-url}')


config.bind('<ctrl+shift+right>', 'tab-next')
config.bind('<ctrl+shift+left>', 'tab-prev')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')

config.bind('<ctrl+j>', 'scroll-page 0 0.25')
config.bind('<ctrl+k>', 'scroll-page 0 -0.25')

config.bind("<Space>wd", 'tab-close')
config.bind("<Space>w<left>", 'tab-prev')
config.bind("<Space>w<right>", 'tab-next')
config.bind("<Space>wn", 'open -t')
config.bind("<Space>w/", 'open -t')
# config.bind('<Space>b', 'bookmark-load')

config.bind('<Space>bb', 'set-cmd-text -s :buffer')
config.bind('<Space>fr', 'set-cmd-text -s :bookmark-load')
config.bind('<Space>fR', 'set-cmd-text -s :bookmark-load -t')
config.bind('<Space>ba', 'bookmark-add')

config.unbind('b')
config.unbind('B')
config.unbind('D')

config.bind('<Space>bp', 'back')
config.bind('<Space>bn', 'forward')

config.bind('<Space>sp', 'open -t g {primary}')
config.bind('<Space>sS', 'open -t g {primary}')
config.bind('<Space>ss', 'open -- {primary}')
config.bind('<Space>sP', 'open -- {primary}')
config.bind('<Space>sc', 'open -t -- {clipboard}')
config.bind('<Space>sC', 'open -- {clipboard}')
config.bind('<Space>fp', 'open -t -- {clipboard}')
config.bind('<Space>fP', 'open -- {clipboard}')
config.bind('<Space>st', 'open -t https://translate.google.com/#auto/sr/{primary}')

config.bind('<Space>ff', 'set-cmd-text -s :open -t')
config.bind('<Space>fF', 'set-cmd-text -s :open')
config.bind('<Space><Space>', 'set-cmd-text -s :')
config.bind('<Alt+x>', 'set-cmd-text -s :')

config.bind("<Ctrl+Shift+Tab>", "tab-prev")
config.bind("<Ctrl+Tab>", "tab-next")

config.bind("<Space>fw", 'set-cmd-text :open -w {url:pretty}')

config.bind("<Space>feR", 'config-source')

def bind_open_site(keys, link):
    config.bind(f"<Space>o{keys}", f'open -t {link}')
    config.bind(f"<Space>O{keys}", f'open {link}')

bind_open_site("y", 'www.youtube.com')
bind_open_site("gg", 'www.google.com')
bind_open_site("gt", 'https://translate.google.com/#auto/sr')
bind_open_site("fb", 'www.facebook.com')
bind_open_site("ns", 'www.nsbuild.rs')
bind_open_site("m", 'www.gmail.com')
bind_open_site("b", 'www.b92.net')
bind_open_site("r", 'www.reddit.com')
bind_open_site("gh", 'www.github.com')
bind_open_site("el", 'www.elektronika.ftn.uns.ac.rs/')
bind_open_site("ftn", 'www.ftn.uns.ac.rs/')
bind_open_site("so", 'www.sofascore.com/')
bind_open_site("tw", 'www.twitter.com/')
bind_open_site("ha", 'www.hackaday.com/')
bind_open_site("li", 'www.linkedin.com/')
bind_open_site("we", 'https://www.weather2umbrella.com/vremenska-prognoza-novi-sad-serbia-sr/meteogram')

config.bind("<Space>qr", 'restart')
config.bind("<Space>qq", 'quit')

c.content.autoplay = False

c.scrolling.bar = "always"
c.scrolling.smooth = False

c.session.lazy_restore = True
c.tabs.select_on_remove = "last-used"

c.editor.command = ['urxvt', '-e', 'emacsclient', '--socket-name=fast_editor', '-c',  '{}']

config.bind("<Space>gs", 'spawn --userscript ~/.config/qutebrowser/userscripts/git_clone {url} default')
config.bind("<Space>gS", 'spawn --userscript ~/.config/qutebrowser/userscripts/git_clone {url}')

config.bind("<Ctrl+k>", 'completion-item-focus --history prev', mode='command')
config.bind("<Ctrl+j>", 'completion-item-focus --history next', mode='command')


bind_chained('<Ctrl+c>', 'enter-mode caret', 'yank selection')
bind_chained('yy', 'enter-mode caret', 'yank selection')

bind_chained("*", 'set-cmd-text /{primary}', "command-accept")

config.bind("<Space>iy", "hint images yank-primary")
config.bind("<Space>io", "spawn feh --geometry 1024x768 {primary}")


def get_styles():
    style_dir = os.path.join(os.path.dirname(os.path.realpath(__file__)), "solarized-everything-css/css")
    styles = os.listdir(style_dir)
    for i, style in enumerate(styles):
        style = os.path.join(style_dir, style, f"{style}-all-sites.css")
        styles[i] = style

    return styles


for i, style in enumerate(get_styles()):
    config.bind(f"<Space>t{i+1}", f"set content.user_stylesheets {style} ;; reload")

config.bind("<Space>tt", f'config-cycle content.user_stylesheets {" ".join(get_styles())} "" ;; reload')
config.bind("<Space>td", f'set content.user_stylesheets "" ;; reload')

home_dir = os.getenv("HOME")
config.bind("<Space>do", f"spawn --detach thunar {home_dir}/Downloads")
