;;; init_packages.el --- elpa package settings

;; Copyright (C) 2012  Le0n Zh4ng

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

;; Load up ELPA, the package manager
(require 'package)
(dolist
    (source '(("marmalade" . "http://marmalade-repo.org/packages/")
              ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)

;; Install packages if not existed
(when (not package-archive-contents)
  (package-refresh-contents))

;; TODO: color-theme from package.el is buggy, use vendor one
(defvar my-packages '(color-theme
                      color-theme-blackboard
                      color-theme-solarized
                      color-theme-library
                      color-theme-sanityinc-solarized
                      scpaste
                      lua-mode
                      clojure-mode
                      cmake-mode
                      coffee-mode
                      markdown-mode
                      yaml-mode
                      tuareg
                      marmalade
                      oddmuse
                      scpaste
                      anything
                      anything-complete
                      anything-config
                      anything-extension
                      loccur
                      haskell-mode
                      ghc
                      magit
                      wget
                      smex
                      dired-details+
                      dired-single
                      dired-isearch
                      buffer-move
                      gtags
                      org
                      org-table-comment
                      slime
                      swank-clojure
                      rainbow-mode
                      rainbow-delimiters
                      bookmark+
                      popwin
                      ;; win-switch               ;; can only install manually
                      quickrun
                      yasnippet
                      yasnippet-bundle))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(provide 'init_packages)
;;; init_packages.el ends here
