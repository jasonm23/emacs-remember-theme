# Emacs - Remember Theme

#### Version: 20130718.230

## Commentary

I keep my `.emacs` in source control, and use the same defaults on all
the machines I use. However, I like to have different themes on
different machines.

To help me do this automatically, I've created this little feature that
remembers the current theme when Emacs closes, and loads it again when
you start up (clearing any other loaded themes first.)

## Installation

Install from the marmalade repo via elpa/pacakge.el, and everything
is set up for you automatically.

Install with: `M-x package-install remember-theme`

### Changelog

* 20130718.230
 * Updated documentation/header
* 20130716.1310
 * Fixed typos
* 20130716.311
 * Unload all loaded themes before loading the remembered theme.
* 0.1.2 
 * Fix bug for non existent .emacs-theme
* 0.1.1
 * Fix autoloads
* 0.1.0
 * Init

