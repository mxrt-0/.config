HTTP_PROXY = "info0sAU5:6JyVyqLeDR@217.194.153.58:50100"

# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

config.load_autoconfig(False)

config.source("themes/solarized-light.py")

config.set("content.cookies.accept", "all", "chrome-devtools://*")
config.set("content.cookies.accept", "all", "devtools://*")
config.set("content.headers.accept_language", "", "https://matchmaker.krunker.io/*")
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}",
    "https://web.whatsapp.com/",
)
# Type: FormatString
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0",
    "https://accounts.google.com/*",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36",
    "https://*.slack.com/*",
)
config.set("content.images", True, "chrome-devtools://*")
config.set("content.images", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome-devtools://*")
config.set("content.javascript.enabled", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "qute://*/*")
config.set("content.pdfjs", True)

c.content.proxy = "none"
c.content.notifications.enabled = False
c.content.javascript.clipboard = "access"
c.content.user_stylesheets = ['~/.config/qutebrowser/css/solarized-light-all-sites.css'] 

c.url.searchengines = {"DEFAULT": "https://www.google.com/search?hl=en&q={}"}
c.url.start_pages = "https://www.google.com"
c.url.default_page = "https://www.google.com"

config.bind(" pn", "set content.proxy none") 
config.bind(" ph", f"set content.proxy http://{HTTP_PROXY}")
config.bind(":r", ":restart")
