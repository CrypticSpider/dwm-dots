// Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
    /*Icon*/        /*Command*/                             /*Update Interval*/     /*Update Signal*/
    {"",            "~/.local/bin/statusbar/sb-dark-words",  16,                     5},  // Volume
    {"",            "~/.local/bin/statusbar/sb-uptime",      2,                      5},
    {"",            "~/.local/bin/statusbar/sb-battery",     2,                      5},  // Battery
    {"",            "~/.local/bin/statusbar/sb-wifi",        1,                      5},
    {"",            "~/.local/bin/statusbar/sb-ram",         2,                      5},  // RAM
    {"",            "~/.local/bin/statusbar/sb-cpu",         2,                      5},  // CPU
    {"",            "~/.local/bin/statusbar/sb-weather",     100,                    5},  // Weather
    {"",            "date '+%b %d (%a) %I:%M%p '",           60,                     0},  // Date and Time
};

// Sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
