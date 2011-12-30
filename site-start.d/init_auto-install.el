;;; init_auto-install.el --- settings for auto-install which install packages from emacswiki/gist.

;; Copyright (C) 2011  Le0n Zh4ng

;; Author: Le0n Zh4ng <leoncamel@gmail.com>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

;; TODO : append "~/.emacs.d/lisp", "~/.emacs.d/local-lisp" to load-list
(setq lisp-dir       (my-file-path-join dotfiles-dir "lisp"))
(setq local-lisp-dir (my-file-path-join dotfiles-dir "local-lisp"))
;;(setq my-elisp-dir (my-file-path-join dotfiles-dir "my-lisp"))
(add-to-list 'load-path lisp-dir)
(add-to-list 'load-path local-lisp-dir)

(require 'auto-install)
(setq auto-install-directory (my-file-path-join lisp-dir "auto-install"))

(provide 'init_auto-install)
;;; init_auto-install.el ends here
