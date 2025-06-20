/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx = 3; /* border pixel of windows */
static const unsigned int snap = 32;    /* snap pixel */
static const unsigned int gappih = 0;   /* horiz inner gap between windows */
static const unsigned int gappiv = 0;   /* vert inner gap between windows */
static const unsigned int gappoh =
    0; /* horiz outer gap between windows and screen edge */
static const unsigned int gappov =
    0; /* vert outer gap between windows and screen edge */
static int smartgaps =
    0; /* 1 means no outer gap when there is only one window */
static const int showbar = 1; /* 0 means no bar */
static const int topbar = 1;  /* 0 means bottom bar */
static const char *fonts[] = {"FiraCode Nerd Font Mono:weight=bold:size=16"};
static const char dmenufont[] = "FiraCode Nerd Font Mono:weight=bold:size=16";
static const char col_black[] = "#000000";
static const char col_white[] = "#FFFFFF";
// static const char col_green[] = "#00FF00";
// static const char col_light_grey[] = "#999999";
static const char col_pale_yellow[] = "#FFFFEA";
static const char col_light_grey[] = "#BFBFBF";
static const char col_dark_grey[] = "#3A3A3A";
static const char *colors[][3] = {
    /*               fg				 bg         border   */
    [SchemeNorm] = {col_dark_grey, col_pale_yellow, col_white},
    [SchemeSel] = {col_light_grey, col_pale_yellow, col_light_grey},
};
/* tagging */
static const char *tags[] = {"!", "@", "#"};

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     isfloating   monitor */
    {"Gimp", NULL, NULL, 0, 1, -1},
    {"Firefox", NULL, NULL, 1 << 8, 0, -1},
};

/* layout(s) */
static const float mfact = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;    /* number of clients in master area */
static const int resizehints =
    0; /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen =
    1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT                                                           \
  1 /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
    /* symbol     arrange function */
    {"[]=", tile}, /* first entry is default */
    {"[\\]", dwindle},
    {"[M]", monocle}};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                                      \
  {MODKEY, KEY, view, {.ui = 1 << TAG}},                                       \
      {MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}},               \
      {MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},                        \
      {MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                                             \
  {                                                                            \
    .v = (const char *[]) { "/bin/sh", "-c", cmd, NULL }                       \
  }

/* commands */
static char dmenumon[2] =
    "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {"dmenu_run",    "-m",  dmenumon,  "-fn",
                                 dmenufont,      "-nb", col_white, "-nf",
                                 col_black,      "-sb", col_white, "-sf",
                                 col_light_grey, NULL};
static const char *termcmd[] = {"st", NULL};
static const char *slockcmd[] = {"slock", NULL};
static const char *greenclipcmd[] = {"/home/mxrt-0/.config/greenclip.sh", NULL};
static const char *flameshotguicmd[] = {"/home/mxrt-0/.config/flameshotgui.sh",
                                        NULL};
static const char *upvolcmd[] = {"/usr/bin/pactl", "set-sink-volume",
                                 "@DEFAULT_SINK@", "+5%", NULL};
static const char *downvolcmd[] = {"/usr/bin/pactl", "set-sink-volume",
                                   "@DEFAULT_SINK@", "-5%", NULL};
static const char *mutevolcmd[] = {"/usr/bin/pactl", "set-sink-mute",
                                   "@DEFAULT_SINK@", "toggle", NULL};

static const Key keys[] = {
    /* modifier                     key        function        argument */
    {MODKEY, XK_d, spawn, {.v = dmenucmd}},
    {MODKEY, XK_Return, spawn, {.v = termcmd}},
    {MODKEY | Mod1Mask, XK_p, spawn, {.v = slockcmd}},
    {MODKEY | Mod1Mask, XK_v, spawn, {.v = greenclipcmd}},
    {MODKEY, XK_p, spawn, {.v = flameshotguicmd}},
    {MODKEY, XK_z, spawn, {.v = upvolcmd}},
    {MODKEY, XK_x, spawn, {.v = downvolcmd}},
    {MODKEY, XK_c, spawn, {.v = mutevolcmd}},
    {MODKEY, XK_b, togglebar, {0}},
    {MODKEY, XK_j, focusstack, {.i = +1}},
    {MODKEY, XK_k, focusstack, {.i = -1}},
    {MODKEY, XK_i, incnmaster, {.i = +1}},
    {MODKEY, XK_o, incnmaster, {.i = -1}},
    {MODKEY | ShiftMask, XK_h, setmfact, {.f = -0.05}},
    {MODKEY | ShiftMask, XK_l, setmfact, {.f = +0.05}},
    // {MODKEY, XK_h, setcfact, {.f = +0.05}},
    // {MODKEY, XK_l, setcfact, {.f = -0.05}},
    {MODKEY, XK_h, setmfact, {.f = +0.05}},
    {MODKEY, XK_l, setmfact, {.f = -0.05}},
    {MODKEY | ShiftMask, XK_o, setcfact, {.f = 0.00}},
    {MODKEY | ShiftMask, XK_Return, zoom, {0}},
    /*{ MODKEY|Mod4Mask,              XK_u,      incrgaps,       {.i = +1 } },
    { MODKEY|Mod4Mask|ShiftMask,    XK_u,      incrgaps,       {.i = -1 } },
    { MODKEY|Mod4Mask,              XK_i,      incrigaps,      {.i = +1 } },
    { MODKEY|Mod4Mask|ShiftMask,    XK_i,      incrigaps,      {.i = -1 } },
    { MODKEY|Mod4Mask,              XK_o,      incrogaps,      {.i = +1 } },
    { MODKEY|Mod4Mask|ShiftMask,    XK_o,      incrogaps,      {.i = -1 } },
    { MODKEY|Mod4Mask,              XK_6,      incrihgaps,     {.i = +1 } },
    { MODKEY|Mod4Mask|ShiftMask,    XK_6,      incrihgaps,     {.i = -1 } },
    { MODKEY|Mod4Mask,              XK_7,      incrivgaps,     {.i = +1 } },
    { MODKEY|Mod4Mask|ShiftMask,    XK_7,      incrivgaps,     {.i = -1 } },
    { MODKEY|Mod4Mask,              XK_8,      incrohgaps,     {.i = +1 } },
    { MODKEY|Mod4Mask|ShiftMask,    XK_8,      incrohgaps,     {.i = -1 } },
    { MODKEY|Mod4Mask,              XK_9,      incrovgaps,     {.i = +1 } },
    { MODKEY|Mod4Mask|ShiftMask,    XK_9,      incrovgaps,     {.i = -1 } },
    { MODKEY|Mod4Mask,              XK_0,      togglegaps,     {0} },
    { MODKEY|Mod4Mask|ShiftMask,    XK_0,      defaultgaps,    {0} },*/
    {MODKEY, XK_Tab, view, {0}},
    {MODKEY, XK_w, killclient, {0}},
    {MODKEY, XK_t, setlayout, {.v = &layouts[0]}},
    {MODKEY, XK_m, setlayout, {.v = &layouts[1]}},
    {MODKEY, XK_f, setlayout, {.v = &layouts[2]}},
    {MODKEY, XK_space, setlayout, {0}},
    {MODKEY | ShiftMask, XK_space, togglefloating, {0}},
    {MODKEY, XK_0, view, {.ui = ~0}},
    {MODKEY | ShiftMask, XK_0, tag, {.ui = ~0}},
    {MODKEY, XK_comma, focusmon, {.i = -1}},
    {MODKEY, XK_period, focusmon, {.i = +1}},
    {MODKEY | ShiftMask, XK_comma, tagmon, {.i = -1}},
    {MODKEY | ShiftMask, XK_period, tagmon, {.i = +1}},
    TAGKEYS(XK_1, 0) TAGKEYS(XK_2, 1) TAGKEYS(XK_3, 2) TAGKEYS(XK_4, 3)
        TAGKEYS(XK_5, 4) TAGKEYS(XK_6, 5) TAGKEYS(XK_7, 6) TAGKEYS(XK_8, 7)
            TAGKEYS(XK_9, 8){MODKEY | ShiftMask, XK_q, quit, {0}},
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
 * ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
    /* click                event mask      button          function argument */
    {ClkLtSymbol, 0, Button1, setlayout, {0}},
    {ClkLtSymbol, 0, Button3, setlayout, {.v = &layouts[2]}},
    {ClkWinTitle, 0, Button2, zoom, {0}},
    {ClkStatusText, 0, Button2, spawn, {.v = termcmd}},
    {ClkClientWin, MODKEY, Button1, movemouse, {0}},
    {ClkClientWin, MODKEY, Button2, togglefloating, {0}},
    {ClkClientWin, MODKEY, Button3, resizemouse, {0}},
    {ClkTagBar, 0, Button1, view, {0}},
    {ClkTagBar, 0, Button3, toggleview, {0}},
    {ClkTagBar, MODKEY, Button1, tag, {0}},
    {ClkTagBar, MODKEY, Button3, toggletag, {0}},
};
