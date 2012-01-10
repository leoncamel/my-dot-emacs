;;; my-utils.el --- my utility functions

;; Copyright (C) 2012  Le0n Zh4ng

;; Author: Le0n Zh4ng <leoncamel@gmail.com>
;; Keywords: tools

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

;; recompile directory (under "~/.emacs.d")
(defun my-recompile-all-directories ()
  ""
  (setq my-list-dir '("lisp"
                      "lisp/auto-install"
                      "site-start.d"))
  (dolist (d my-list-dir)
    (byte-recompile-directory (my-file-path-join dotfiles-dir d) 0)))

;; show emacs startup time
(defun message-startup-time ()
  (message "Emacs loaded in %dms"
           (/ (- (+ (third after-init-time) (* 1000000 (second after-init-time)))
                 (+ (third before-init-time) (* 1000000 (second before-init-time))))
              1000)))

(provide 'my-utils)
;;; my-utils.el ends here
