/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx        = 4;        /* border pixel of windows */
static const unsigned int snap            = 32;       /* snap pixel */
static const int showbar                  = 1;        /* 0 means no bar */
static const int topbar                   = 1;        /* 0 means bottom bar */
static const char *fonts[]                = { "BigBlueTerm437NerdFontMono:weight=bold:size=18" };
static const char dmenufont[]             = "BigBlueTerm437NerdFontMono:weight=bold:size=18";
static const char col_black[]             = "#000000";
static const char col_dark_yellow_green[] = "#99994C";
static const char col_pale_yellow[]       = "#FFFFEA";
static const char *colors[][3]            = {
    /*               fg			            bg               border   */
    [SchemeNorm] = { col_black,             col_pale_yellow, col_dark_yellow_green },
    [SchemeSel]  = { col_dark_yellow_green, col_pale_yellow, col_black },
};

/* tagging */
static const char *tags[] = { "!", "@", "#" };

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask 
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2]           = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[]     = { 
    "dmenu_run", 
    "-m", dmenumon, 
    "-fn", dmenufont, 
    "-nb", col_pale_yellow, 
    "-nf", col_black, 
    "-sb", col_pale_yellow, 
    "-sf", col_dark_yellow_green, 
    NULL 
};
static const char *termcmd[]      = { "st", NULL };
static const char *slockcmd[]     = { "slock", NULL };
static const char *upvolcmd[]     = { "/usr/bin/pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%", NULL };
static const char *downvolcmd[]   = { "/usr/bin/pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%", NULL };
static const char *mutevolcmd[]   = { "/usr/bin/pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|Mod1Mask,              XK_p,      spawn,          {.v = slockcmd } },
	{ MODKEY,                       XK_z,      spawn,          {.v = upvolcmd } },
	{ MODKEY,                       XK_x,      spawn,          {.v = downvolcmd } },
	{ MODKEY,                       XK_c,      spawn,          {.v = mutevolcmd } },

	{ MODKEY|Mod1Mask,              XK_v,      spawn,          SHCMD("$HOME/.config/greenclip.sh") },
	{ MODKEY,                       XK_p,      spawn,          SHCMD("$HOME/.config/flameshot.sh") },

	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_w,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* UNUSED */

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
    { NULL,       NULL,       NULL,       0,            0,          -1 },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
    { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
};

/* UNUSED */
