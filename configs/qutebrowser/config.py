c.tabs.background = True
c.tabs.position = 'top'
c.tabs.show = 'always'
c.tabs.padding = {"bottom": 5, "left": 5, "right": 5, "top": 5}
c.tabs.favicons.scale = 1.3

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

config.bind('<Space>sp', 'open -t -- {primary}')
config.bind('<Space>sS', 'open -t -- {primary}')
config.bind('<Space>ss', 'open -- {primary}')
config.bind('<Space>sP', 'open -- {primary}')
config.bind('<Space>sc', 'open -t -- {clipboard}')
config.bind('<Space>sC', 'open -- {clipboard}')
config.bind('<Space>fp', 'open -t -- {clipboard}')
config.bind('<Space>fP', 'open -- {clipboard}')

config.bind('<Space>ff', 'set-cmd-text -s :open -t')
config.bind('<Space>fF', 'set-cmd-text -s :open')
config.bind('<Space><Space>', 'set-cmd-text -s :')
config.bind('<Alt+x>', 'set-cmd-text -s :')

config.bind("<Ctrl+Shift+Tab>", "tab-prev")
config.bind("<Ctrl+Tab>", "tab-next")

config.bind("<Space>fw", 'set-cmd-text :open -w {url:pretty}')

config.bind("<Space>feR", 'config-source')

config.bind("<Space>oy", 'open -t www.youtube.com')
config.bind("<Space>ogg", 'open -t www.google.com')
config.bind("<Space>ofb", 'open -t www.facebook.com')
config.bind("<Space>ons", 'open -t www.nsbuild.rs')
config.bind("<Space>om", 'open -t www.gmail.com')
config.bind("<Space>ob", 'open -t www.b92.net')
config.bind("<Space>or", 'open -t www.reddit.com')
config.bind("<Space>ogh", 'open -t www.github.com')
config.bind("<Space>oel", 'open -t www.elektronika.ftn.uns.ac.rs/')
config.bind("<Space>oftn", 'open -t www.ftn.uns.ac.rs/')

config.bind("<Space>qr", 'restart')
config.bind("<Space>qq", 'quit')

c.content.autoplay = False

c.scrolling.bar = "always"
c.scrolling.smooth = False

c.session.lazy_restore = True
c.tabs.select_on_remove = "next"

c.editor.command = ['xfce4-terminal', '-e', 'vim', '{file}']

config.bind("<Space>gs", 'spawn --userscript ~/.config/qutebrowser/userscripts/git_clone {url} default')
config.bind("<Space>gS", 'spawn --userscript ~/.config/qutebrowser/userscripts/git_clone {url}')
