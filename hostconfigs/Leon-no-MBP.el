;;; Leon-no-MBP.el --- hostconfigs for host Leon-no-MBP

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

(require 'init_setenv)

;; executable path priority in *reverse* order
(setq my-exec-path
      (reverse
       '(
         ;; High Priority ;;
         "~/bin/"
         ;; texlive 2011
         "/usr/local/texlive/2011/bin/x86_64-darwin/"
         ;; homebrew
         "~/bin/homebrew/bin/"
         "~/bin/homebrew/sbin/"
         ;; macports
         "/opt/local/bin/"
         "/opt/local/sbin/"
         ;;
         "/usr/X11/bin/"
         "/usr/local/bin/"
         ;; Low Priority ;;
         )))

(dolist (p my-exec-path)
  (prepend-exec-path p))

;; dired -- use external ls program
(setq insert-directory-program "gls")
(setq ls-lisp-use-insert-directory-program t)
(setq dired-listing-switches "-la --group-directories-first")

(provide 'Leon-no-MBP)
;;; Leon-no-MBP.el ends here
