;;; leon-new-desktop.el --- configs for leon-new-desktop

;; Copyright (C) 2011,2012  Le0n Zh4ng

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
         "~/bin/global-5.9.5/bin"
         ;; textlive
         "/usr/local/texlive/2011/bin/x86_64-linux"
         ;;
         "~/.cabal/bin"
         "~/bin/ghc-7.4.1/bin"
         ;; Low Priority ;;
         )))

(dolist (p my-exec-path)
  (prepend-exec-path p))

;; dired -- use external ls program
(setq insert-directory-program "ls")
(setq ls-lisp-use-insert-directory-program t)
(setq dired-listing-switches "-la --group-directories-first")

;; browser
(setq browse-url-browser-function 'browse-url-firefox)

;; haskell's scion settings
(setq my-cfg/enable-scion t)
(setq my-cfg/enable-ghc-mod t)

(provide 'leon-new-desktop)
;;; leon-new-desktop.el ends here
