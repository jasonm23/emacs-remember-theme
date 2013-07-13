;;; remember-theme.el --- Remembers the last theme in use and re-loads for the next session.
;;;
;;; Author: Jason Milkins <jasonm23@gmail.com>
;;; Url: https://github.com/jasonm23/emacs-remember-theme
;;; Version: 0.1.0
;;;
;;; Changelog :
;;;     0.1.0 : Init
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, version 3 of the License.
;;;
;;; This file is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Emacs.
;;;
;;; This file is not a part of Emacs
;;;
;;; Commentary:
;;;
;;; Assuming that you version your .emacs with git (etc), you may not
;;; want to keep some of these defaults versioned. Personally I don't
;;; want to use the same theme everywhere, for example on a terminal
;;; session, one theme looks better, or perhaps on two different
;;; machines I want an at a glance difference.
;;;
;;; To help me with this problem, I've written two simple function
;;; which save and load the current theme name to ~/.emacs-theme
;;; (notably, outside of ~/.emacs.d)
;;;
;;; Using it is simply a case of requiring the library
;;;
;;;    (require 'remember-theme)
;;;
;;; Which will automatically add remember-theme-load to the
;;; after-init-hook and remember-theme-save to the kill-emacs-hook
;;;
;;; Installing via elpa (marmalade repo) will automatically set this
;;; up for you
;;;
;;;    package-install remember-theme

(defun remember-theme-save ()
  "Creates or modifies a file .emacs-theme in the load-path, and
stores the name of the current Emacs theme, for retrieval by
load-theme-last"
  (append-to-file (format "%s\n" (symbol-name (car custom-enabled-themes)))
                  nil
                  "~/.emacs-theme"))

(defun remember-theme-load ()
  "Load the theme used last - This is stored in the file
~/.emacs-theme. The last line of .emacs-theme is read as the
theme name.

The file is created and updated by remember-theme-last

The theme must be valid, and already available in the
custom-theme-load-path"
  (and (file-exists-p "~/.emacs-theme")
      (load-theme (intern (car (nreverse (with-temp-buffer
                                           (insert-file-contents "~/.emacs-theme")
                                           (split-string
                                            (buffer-string)))))))))

;;;###autoload
(when load-file-name
  (add-hook 'after-init-hook 'remember-theme-load)
  (add-hook 'kill-emacs-hook 'remember-theme-save))
  
(provide 'remember-theme)

;;; remember-theme.el ends here
