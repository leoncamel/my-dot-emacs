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

;; for debug
;; (setq debug-on-error t)

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Load path etc.
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)

;; load-path utility function
(require 'cl)
(defun my-file-path-join (&rest paths)
  (reduce #'(lambda (x y) (concat (file-name-as-directory x) y))
          paths))

;; Utilities function to add load-path
(defun my-dotfile (&rest paths)
  (reduce #'(lambda (x y) (concat (file-name-as-directory x) y))
          (cons dotfiles-dir paths)))

(defun my-dotfile-bin (&rest paths)
  (reduce #'(lambda (x y) (concat (file-name-as-directory x) y))
          (append (list dotfiles-dir "bin/") paths)))

(defun my-dotfile-etc (&rest paths)
  (reduce #'(lambda (x y) (concat (file-name-as-directory x) y))
          (append (list dotfiles-dir "etc/") paths)))

(defun my-dotfile-var (&rest paths)
  (reduce #'(lambda (x y) (concat (file-name-as-directory x) y))
          (append (list dotfiles-dir "var/") paths)))

(defun my-dotfile-hostconfigs (&rest paths)
  (reduce #'(lambda (x y) (concat (file-name-as-directory x) y))
          (append (list dotfiles-dir "hostconfigs/") paths)))

(defun my-dotfile-userconfigs (&rest paths)
  (reduce #'(lambda (x y) (concat (file-name-as-directory x) y))
          (append (list dotfiles-dir "userconfigs/") paths)))

(defun my-dotfile-vendor (&rest paths)
  (reduce #'(lambda (x y) (concat (file-name-as-directory x) y))
          (append (list dotfiles-dir "vendor/") paths)))

(defun my-dotfile-lisp (&rest paths)
  (reduce #'(lambda (x y) (concat (file-name-as-directory x) y))
          (append (list dotfiles-dir "lisp/") paths)))

(defun my-dotfile-local-lisp (&rest paths)
  (reduce #'(lambda (x y) (concat (file-name-as-directory x) y))
          (append (list dotfiles-dir "local-lisp/") paths)))

(defun my-dotfile-elisp (&rest paths)
  (reduce #'(lambda (x y) (concat (file-name-as-directory x) y))
          (append (list dotfiles-dir "elisp/") paths)))

(defun my-dotfile-my-elisp (&rest paths)
  (reduce #'(lambda (x y) (concat (file-name-as-directory x) y))
          (append (list dotfiles-dir "my-elisp/") paths)))

(defun my-dotfile-private (&rest paths)
  (reduce #'(lambda (x y) (concat (file-name-as-directory x) y))
          (append (list dotfiles-dir "private/") paths)))

(defun add-vendor-subdir (vendor-path)
  (add-to-list 'load-path
               (my-dotfile "vendor/" vendor-path)))

;; add "~/.emacs.d/site-start.d/" to load-path
(setq site-start-dir (my-dotfile "site-start.d/"))
(add-to-list 'load-path site-start-dir)

;; (if (file-exists-p site-start-dir)
;;     (mapc #'load (directory-files site-start-dir nil ".*el$")))

(setq system-specific-config (my-dotfile-hostconfigs
                              (concat system-name ".el"))
      user-specific-config   (my-dotfile-userconfigs
                              (concat user-login-name ".el"))
      user-specific-dir      (my-dotfile-userconfigs
                              user-login-name))

(if (file-exists-p system-specific-config)
    (load system-specific-config))

;; load init_main.el
(require 'init_main)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load Platform independent configs
;; You can keep system- or user-specific customizations here
(add-to-list 'load-path user-specific-dir)
(if (file-exists-p user-specific-dir)
    (mapc #'load (directory-files user-specific-dir nil ".*el$")))
(if (file-exists-p user-specific-config)
    (load user-specific-config))

(put 'set-goal-column 'disabled nil)

;;; init.el ends here
