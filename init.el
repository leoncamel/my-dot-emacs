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
  (reduce #'(lambda (x y) (concat (file-name-as-directory x) y)) paths))

;; add "~/.emacs.d/site-start.d/" to load-path
(setq site-start-dir (my-file-path-join dotfiles-dir "site-start.d/"))
(add-to-list 'load-path site-start-dir)

;; (if (file-exists-p site-start-dir)
;;     (mapc #'load (directory-files site-start-dir nil ".*el$")))

(setq system-specific-config (my-file-path-join dotfiles-dir
                                                "hostconfigs/"
                                                (concat system-name ".el"))
      user-specific-config   (my-file-path-join dotfiles-dir
                                                "userconfigs/"
                                                (concat user-login-name ".el"))
      user-specific-dir      (my-file-path-join dotfiles-dir
                                                "userconfigs/"
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
