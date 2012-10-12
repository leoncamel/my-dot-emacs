;;; init_dired.el --- dired settings

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

(require 'ls-lisp)
(require 'dired)
(require 'dired+)

(setq ls-lisp-dirs-first t)

;; use single dired buffer
(require 'dired-single)

;; TODO : when refersh(press 'g' in dired,
;;        it require flymake-mode, pretty wired.
(require 'flymake)

;; Reference :: http://xahlee.org/emacs/emacs_dired_open_file_in_ext_apps.html
(defun open-in-external-app ()
  "Open the current file or dired marked files in external app.
Works in Microsoft Windows, Mac OS X, Linux."
  (interactive)

  (let ( doIt
         (myFileList
          (cond
           ((string-equal major-mode "dired-mode") (dired-get-marked-files))
           (t (list (buffer-file-name))) ) ) )

    (setq doIt (if (<= (length myFileList) 5)
                   t
                 (y-or-n-p "Open more than 5 files?") ) )
    
    (when doIt
      (cond
       ((string-equal system-type "windows-nt")
        (mapc (lambda (fPath) (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" fPath t t)) ) myFileList)
        )
       ((string-equal system-type "darwin")
        (mapc (lambda (fPath) (shell-command (concat "open " fPath )) )  myFileList) )
       ((string-equal system-type "gnu/linux")
        (mapc (lambda (fPath) (shell-command (concat "xdg-open " fPath )) ) myFileList) ) )
      ) ) )

(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when it's
   loaded."
  ;; <add other stuff here>
  (define-key dired-mode-map [return] 'dired-single-buffer)
  (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
  (define-key dired-mode-map "^"
    (function
     (lambda nil (interactive) (dired-single-buffer ".."))))
  
  ;; allow dired to be able to delete or copy a whole dir.
  ;; “always” means no asking. “top” means ask once. Any other symbol means ask each and every time for a dir and subdir.
  (setq dired-recursive-copies (quote always))
  (setq dired-recursive-deletes (quote top)))

;; if dired's already loaded, then the keymap will be bound
(if (boundp 'dired-mode-map)
    ;; we're good to go; just add our bindings
    (my-dired-init)
  ;; it's not loaded yet, so add our bindings to the load-hook
  (add-hook 'dired-load-hook 'my-dired-init))


(provide 'init_dired)
;;; init_dired.el ends here
