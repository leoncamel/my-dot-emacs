;;; init.el --- Everything started from here
;;
;; My init.el, majorly based on the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Load path etc.
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)

;; Load up ELPA, the package manager
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)


;; Install packages if not existed
(when (not package-archive-contents)
  (package-refresh-contents))

;; TODO: color-theme from package.el is buggy, use vendor one
(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-eshell
                      starter-kit-bindings
                      scpaste
                      lua-mode
                      clojure-mode
                      clojure-test-mode
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
                      haskell-mode
                      magit
                      dired-details+
                      dired-single
                      dired-isearch
                      org
                      org-table-comment
                      slime
                      bookmark+
                      yasnippet
                      yasnippet-bundle))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; load init_main.el
(setq site-start-dir (concat dotfiles-dir "site-start.d/"))
(add-to-list 'load-path site-start-dir)

(if (file-exists-p site-start-dir)
    (mapc #'load (directory-files site-start-dir nil ".*el$")))

(require 'init_main)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load Platform independent configs

;; You can keep system- or user-specific customizations here
(setq system-specific-config (concat dotfiles-dir "/hostconfigs/" system-name ".el")
      user-specific-config (concat dotfiles-dir "/userconfigs/" user-login-name ".el")
      user-specific-dir (concat dotfiles-dir "/userconfigs/" user-login-name))
(add-to-list 'load-path user-specific-dir)

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-dir)
  (mapc #'load (directory-files user-specific-dir nil ".*el$")))
(if (file-exists-p user-specific-config) (load user-specific-config))

;;; init.el ends here
(put 'set-goal-column 'disabled nil)

