# Emacs - Remember Themes

#### Version: 20160210.1644

## Commentary:

I keep my `.emacs` in source control, and use the same defaults on all
the machines I use. However, I like to have different themes on
different machines.

To help me do this automatically, I've created this little feature that
remembers the current theme when Emacs closes, and loads it again when
you start up (clearing any other loaded themes first.)

If you have things you'd like to run after the theme has loaded,
use the hook provided, `remember-theme-after-load-hook` (Use `M-x describe-function`
RET `add-hook` if you haven't used hooks before.)

## Installation:

Install from the melpa via elpa/pacakge.el.
Then in .emacs / .emacs.d/init.el add:

    (remember-theme-load)
    (add-hook 'kill-emacs-hook 'remember-theme-save)

Install with: `M-x package-install remember-themes`

## Changelog:

- 20160210.1644
    - Rename to avoid inclusion in custom-available-themes

- 20150308.1931
    - Stop forcing load at after-init, update instructions.

- 20140122.1500
    - Add custom hook to be run after loading the remembered theme

- 20131231.0025
    - Custom Variable to control location of remember-theme (defaults to ~/.emacs-theme)

- 20131215.0441
    - Conditional execution (no ~/.emacs-theme, no disable current theme(s) / no theme load attempt)

- 20130807.1251
    - Conditional execution (no theme, no save)

- 20130718.230
    - Updated documentation/header

- 20130716.1310
    - Fixed typos

- 20130716.311
    - Unload all loaded themes before loading the remembered theme.
