# Remember Theme

Assuming that you version your .emacs with git (etc), you may not
want to keep some of these defaults versioned. Personally I don't
want to use the same theme everywhere, for example on a terminal
session, one theme looks better, or perhaps on two different
machines I want an at a glance difference.

To help me with this problem, I've written two simple function
which save and load the current theme name to ~/.emacs-theme
(notably, outside of ~/.emacs.d)

Using it is simply a case of requiring the library

    (require 'remember-theme)

Which will automatically add remember-theme-load to the
after-init-hook and remember-theme-save to the kill-emacs-hook

If you install via elpa (marmalade repo) this should happen
automatically, without any other intervention.

Just use `package-install remember-theme`

