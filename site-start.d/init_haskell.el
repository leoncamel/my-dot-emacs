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


;; ghc mode
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

;;;;;;;;;;;
;; scion ;;
;;;;;;;;;;;
(defvar my-cfg/enable-scion nil
  "Enable scion or not, default value is nil")

(when my-cfg/enable-scion
  (add-to-list 'load-path
               (my-file-path-join dotfiles-dir "vendor/scion/"))
  (require 'scion)

  ;; if scion-server is not in your $PATH
  (setq scion-program "~/.cabal/bin/scion-server")

  (defun my-haskell-hook ()
    ;; Whenever we open a file in Haskell mode, also activate Scion
    (scion-mode 1)
    ;; Whenever a file is saved, immediately type check it and
    ;; highlight errors/warnings in the source.
    (scion-flycheck-on-save 1))

  (add-hook 'haskell-mode-hook 'my-haskell-hook)

  ;; Use ido-mode completion (matches anywhere, not just beginning)
  ;;
  ;; WARNING: This causes some versions of Emacs to fail so badly
  ;; that Emacs needs to be restarted.
  (setq scion-completing-read-function 'ido-completing-read))

(provide 'init_haskell)
;;; init_haskell.el ends here
