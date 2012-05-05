;;; init_haskell.el --- haskell-mode settings

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

(defvar my-cfg/enable-scion nil
  "Enable scion, default value is nil")

(defvar my-cfg/enable-ghc-mod nil
  "Enable ghc-mod, default value is nil")

(defvar my-cfg/enable-haskell-mode-git nil
  "Enable haskell-mode.git, default value is nil")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; haskell-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Customization
(custom-set-variables
 ;; Use cabal-dev for the GHCi session. Ensures our dependencies are in scope.
 '(haskell-process-type 'cabal-dev)
 
 ;; Use notify.el (if you have it installed) at the end of running
 ;; Cabal commands or generally things worth notifying.
 '(haskell-notify-p t))

(add-hook 'haskell-mode-hook 'my-haskell-hook)
(add-hook 'haskell-cabal-mode-hook 'my-haskell-cabal-hook)

;; Haskell main editing mode key bindings.
(defun my-haskell-hook ()
  ;; Use simple indentation.
  ;; (turn-on-haskell-simple-indent)
  ;; (define-key haskell-mode-map (kbd "<return>") 'haskell-simple-indent-newline-same-col)
  ;; (define-key haskell-mode-map (kbd "C-<return>") 'haskell-simple-indent-newline-indent)
    
  (turn-on-haskell-indentation)
  
  ;; Load the current file (and make a session if not already made).
  (define-key haskell-mode-map [?\C-c ?\C-l] 'haskell-process-load-file)
  (define-key haskell-mode-map [f5] 'haskell-process-load-file)

  ;; Switch to the REPL.
  (define-key haskell-mode-map [?\C-c ?\C-z] 'haskell-interactive-switch)
  ;; “Bring” the REPL, hiding all other windows apart from the source
  ;; and the REPL.
  (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)

  ;; Build the Cabal project.
  ;; (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  ;; Interactively choose the Cabal command to run.
  ;; (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)

  ;; Get the type and info of the symbol at point, print it in the
  ;; message buffer.
  ;; (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
  ;; (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)

  ;; Contextually do clever things on the space key, in particular:
  ;;   1. Complete imports, letting you choose the module name.
  ;;   2. Show the type of the symbol after the space.
  ;; (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

  ;; Jump to the imports. Keep tapping to jump between import
  ;; groups. C-u f8 to jump back again.
  ;; (define-key haskell-mode-map [f8] 'haskell-navigate-imports)

  ;; Jump to the definition of the current symbol.
  ;; (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-tag-find)

  ;; Save the current buffer and generate etags (a TAGS file) for the
  ;; whole project.
  ;; TODO:
  ;;  haskell-mode-save-buffer-and-tags:
  ;;      Symbol's function definition is void:
  ;;            haskell-process-generate-tags
  ;; (define-key haskell-mode-map (kbd "C-x C-s") 'haskell-mode-save-buffer-and-tags)

  ;; Indent the below lines on columns after the current column.
  
  ;; (define-key haskell-mode-map (kbd "C-<right>")
  ;;   (lambda ()
  ;;     (interactive)
  ;;     (haskell-move-nested 1)))
  
  ;; Same as above but backwards.
  
  ;; (define-key haskell-mode-map (kbd "C-<left>")
  ;;   (lambda ()
  ;;     (interactive)
  ;;     (haskell-move-nested -1)))

  ;; Utility function wrote by myself
  (add-to-list 'load-path (my-dotfile-my-elisp))
  (require 'my-hs-utilities)
  )

;; Useful to have these keybindings for .cabal files, too.
(defun my-haskell-cabal-hook ()
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
  (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
  (define-key haskell-cabal-mode-map [?\C-c ?\C-z] 'haskell-interactive-switch))

;;
;; FIXME: mix usage ghc-mod and haskell-mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ghc mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when my-cfg/enable-ghc-mod
  (add-to-list 'load-path
               (my-dotfile-vendor "ghc-mod.git/elisp/"))
  (autoload 'ghc-init "ghc" nil t)

  (add-hook 'haskell-mode-hook 'my-ghc-mod-hook)

  ;; ghci-completion
  (require 'ghci-completion)
  (add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion))

(defun my-ghc-mod-hook ()
  (ghc-init)
  (flymake-mode))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; scion
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (when my-cfg/enable-scion
;;   (add-to-list 'load-path
;;                (my-dotfile-vendor "scion/"))
;;   (require 'scion)

;;   ;; if scion-server is not in your $PATH
;;   (setq scion-program (executable-find "scion-server"))

;;   (defun my-haskell-hook ()
;;     ;; Whenever we open a file in Haskell mode, also activate Scion
;;     (scion-mode 1)
;;     ;; Whenever a file is saved, immediately type check it and
;;     ;; highlight errors/warnings in the source.
;;     (scion-flycheck-on-save 1))

;;   (add-hook 'haskell-mode-hook 'my-haskell-hook)

;;   ;; Use ido-mode completion (matches anywhere, not just beginning)
;;   ;;
;;   ;; WARNING: This causes some versions of Emacs to fail so badly
;;   ;; that Emacs needs to be restarted.
;;   (setq scion-completing-read-function 'ido-completing-read))


(provide 'init_haskell)
;;; init_haskell.el ends here
