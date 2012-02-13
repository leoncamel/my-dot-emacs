;;; init_keys.el --- key bindings

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

(global-set-key (kbd "M-/") 'hippie-expand)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; If you want to be able to M-x without meta (phones, etc)
(global-set-key (kbd "C-c x") 'execute-extended-command)

;; Help should search more than just commands
;; (global-set-key (kbd "C-h a") 'apropos)

;; M-S-6 is awkward
(global-set-key (kbd "C-c q") 'join-line)

;; fullscreen
(require 'my-fullscreen)
(global-set-key (kbd "C-c m")   'toggle-fullscreen)
(global-set-key (kbd "C-c t")   'toggle-transparency)

;; In order to avoid conflict with cua-mode.
;; reference: http://www.emacswiki.org/emacs/WinnerMode

(eval-after-load "windmove"
  '(progn
     (windmove-default-keybindings 'meta)
     ))
(require 'windmove)

(eval-after-load "buffer-move"
  '(progn
     (global-set-key (kbd "<C-S-up>")     'buf-move-up)
     (global-set-key (kbd "<C-S-down>")   'buf-move-down)
     (global-set-key (kbd "<C-S-left>")   'buf-move-left)
     (global-set-key (kbd "<C-S-right>")  'buf-move-right)
     ))
(require 'buffer-move)

;; win-switch
(eval-after-load "win-switch"
  '(progn
     ;; (require 'win-switch)
     ;; (autoload 'win-switch-once-commands "win-switch" "" t nil)
     ;; (autoload 'win-switch-once-map "win-switch" "" t nil)
     ;; (global-set-key "\C-xo" 'win-switch-dispatch)
     (defun win-switch-setup-keys-hjkl (&rest dispatch-keys)
       "My own win-switch keybinds. The arguments DISPATCH-KEYS, if non-nil,
should be a list of keys that will be bound globally to
`win-switch-dispatch'."
       (interactive)
       (win-switch-set-keys '("k") 'up)
       (win-switch-set-keys '("j") 'down)
       (win-switch-set-keys '("h") 'left)
       (win-switch-set-keys '("l") 'right)
       (win-switch-set-keys '("n") 'next-window)
       (win-switch-set-keys '("p") 'previous-window)
       (win-switch-set-keys '("J") 'enlarge-vertically)
       (win-switch-set-keys '("K") 'shrink-vertically)
       (win-switch-set-keys '("H") 'shrink-horizontally)
       (win-switch-set-keys '("L") 'enlarge-horizontally)
       (win-switch-set-keys '(" ") 'other-frame)
       (win-switch-set-keys '("u" [return]) 'exit)
       (win-switch-set-keys '("|") 'split-horizontally)
       (win-switch-set-keys '("-") 'split-vertically) ; visual not letter mnemonic
       (win-switch-set-keys '("0") 'delete-window)
       (win-switch-set-keys '("\M-\C-g") 'emergency-exit)
       (dolist (key dispatch-keys)
         (global-set-key key 'win-switch-dispatch)))
     (setq win-switch-idle-time 5)
     (setq win-switch-window-threshold 1)
     (win-switch-setup-keys-hjkl "\C-xo")
     ))
(require 'win-switch)

;; smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(provide 'init_keys)
;;; init_keys.el ends here
