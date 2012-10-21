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
                      "vendor/color-theme-wombat-dark.git/"
                      "site-start.d"))
  (dolist (d my-list-dir)
    (byte-recompile-directory (my-dotfile d) 0)))

;; show emacs startup time
(defun message-startup-time ()
  (message "Emacs loaded in %dms"
           (/ (- (+ (third after-init-time) (* 1000000 (second after-init-time)))
                 (+ (third before-init-time) (* 1000000 (second before-init-time))))
              1000)))

;; Basic Editing
;; Reference : http://www.emacswiki.org/emacs/DeletingSyntax
(defun kill-syntax-forward ()
  "Kill characters with syntax at point."
  (interactive)
  (kill-region (point)
               (progn (skip-syntax-forward (string (char-syntax (char-after))))
                      (point))))

(defun kill-syntax-backward ()
  "Kill characters with syntax at point."
  (interactive)
  (kill-region (point)
               (progn (skip-syntax-backward (string (char-syntax (char-before))))
                      (point))))

(provide 'my-utils)
;;; my-utils.el ends here
