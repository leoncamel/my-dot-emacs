;;; my-hs-utilities.el --- Some haskell utility functions

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

(add-to-list 'load-path
             (my-file-path-join dotfiles-dir "vendor/cmm-mode.git"))
(require 'cmm-mode)

(defun my-hs-compile ()
  ""
  (interactive)
  (let* ((bfn (file-name-nondirectory (buffer-file-name)))
         (bfp (file-name-directory (buffer-file-name)))
         (ghccmd (format "ghc -O -ddump-simpl -ddump-stg -ddump-cmm -ddump-asm  -fforce-recomp -outputdir /tmp %s"
                         (file-name-nondirectory (buffer-file-name))))
         (tmpbuf (format "* GHC dump %s *" bfn)))
    (message "GHC command : %s" ghccmd)
    (set-buffer (get-buffer-create tmpbuf))
    (erase-buffer)
    (insert (shell-command-to-string ghccmd))
    (switch-to-buffer-other-window tmpbuf)
    ))

(defun my-hs-compile-core ()
  "Compiled and load current buffer as tidy core"
  (interactive)
  (save-buffer)
  (let* ((bfn (file-name-nondirectory (buffer-file-name)))
         (bfp (file-name-directory (buffer-file-name)))
         (tmpbuf (format "* GHC Core: %s *" bfn))
         (core-buffer (generate-new-buffer tmpbuf)))
    ;; (message "GHC command : %s" ghccmd)
    (call-process "ghc" nil core-buffer nil "-c" "-fforce-recomp" "-ddump-simpl" "-outputdir" "/tmp" "-O2" bfn)
    (display-buffer core-buffer)
    (with-current-buffer core-buffer
      (ghc-core-mode))
    ))

(defun my-hs-compile-cmm ()
  "Compiled and load current buffer as CMM"
  (interactive)
  (save-buffer)
  (let* ((bfn (file-name-nondirectory (buffer-file-name)))
         (bfp (file-name-directory (buffer-file-name)))
         (tmpbuf (format "* GHC CMM: %s *" bfn))
         (core-buffer (generate-new-buffer tmpbuf)))
    ;; (message "GHC command : %s" ghccmd)
    (call-process "ghc" nil core-buffer nil "-c" "-fforce-recomp" "-ddump-cmm" "-outputdir" "/tmp" "-O2" bfn)
    (display-buffer core-buffer)
    (with-current-buffer core-buffer
      (cmm-mode))
    ))

(provide 'my-hs-utilities)
;;; my-hs-utilities.el ends here
