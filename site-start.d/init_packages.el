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
    (source '(("melpa"     . "http://melpa.milkbox.net/packages/")
              ("marmalade" . "http://marmalade-repo.org/packages/")
              ("elpa"      . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)

;; Install packages if not existed
(when (not package-archive-contents)
  (package-refresh-contents))

;; TODO: color-theme from package.el is buggy, use vendor one
(defvar my-packages
  '(
    ;;;;;;;;;;;;;;;;;;;;
    ;; color-theme
    color-theme
    color-theme-blackboard
    color-theme-solarized
    color-theme-library
    color-theme-sanityinc-solarized

    ;;;;;;;;;;;;;;;;;;;;
    ;; Programming Mode
    zencoding-mode
    lua-mode
    clojure-mode
    cmake-mode
    coffee-mode
    markdown-mode
    pandoc-mode
    yaml-mode
    tuareg
    marmalade
    oddmuse
    scala-mode

    ;;;;;;;;;;;;;;;;;;;;
    ;; Web Dev
    js2-mode
 
    ;;;;;;;;;;;;;;;;;;;;
    ;; latex
    auctex

    ;;;;;;;;;;;;;;;;;;;;
    ;; Haskell
    haskell-mode
    ;; ghc                        ;; use vendor/ghc-mod.git now
    ghci-completion

    ;;;;;;;;;;;;;;;;;;;;
    ;; Anything
    anything
    anything-complete
    anything-config
    anything-extension

    ;;;;;;;;;;;;;;;;;;;;
    ;; Helm
    helm
    helm-projectile

    ;;;;;;;;;;;;;;;;;;;;
    ;; Auto-complete
    auto-complete

    ;;;;;;;;;;;;;;;;;;;;
    ;; Flymake
    flymake
    flymake-jslint
    flymake-tuareg
    
    ;;;;;;;;;;;;;;;;;;;;
    ;; Text Editing
    org
    org-table-comment
    yasnippet
    ;; yasnippet-bundle           ;; `yasnippet` is under active development.
    autopair
    paredit
    expand-region
    volatile-highlights
    deft

    ;;;;;;;;;;;;;;;;;;;;
    ;; SLIME
    slime
    ;; swank-clojure
    slime-repl
    elisp-slime-nav

    ;;;;;;;;;;;;;;;;;;;;
    ;; Lisp Modes
    rainbow-mode
    rainbow-delimiters

    ;;;;;;;;;;;;;;;;;;;;
    ;; csharp & fsharp
    csharp-mode

    ;;;;;;;;;;;;;;;;;;;;
    ;; Ess
    ess

    ;;;;;;;;;;;;;;;;;;;;
    ;; Buffer and Window
    buffer-move
    popwin
    win-switch
    workgroups
    window-layout
    e2wm

    ;;;;;;;;;;;;;;;;;;;;
    ;; bookmarks
    bm
    
    ;;;;;;;;;;;;;;;;;;;;
    ;; Utilities
    melpa
    loccur
    gtags
    magit
    wget
    smex
    scpaste
    dired-details+
    dired-single
    dired-isearch
    undo-tree
    highlight-symbol
    ido-ubiquitous
    bookmark+
    quickrun))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(provide 'init_packages)
;;; init_packages.el ends here
