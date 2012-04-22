;;; init_session.el --- session settings

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

;; 前回のカーソル位置を記憶 session に代替え
;(require 'saveplace)
;(setq-default save-place t)

;;; Desktop
(setq *foo-desktop-dir* (my-dotfile "desktop"))
(setq desktop-dir *foo-desktop-dir*)
(setq desktop-path (list *foo-desktop-dir*))
(desktop-save-mode 1)
(setq history-length 250)

;; winring
;; (require 'winring)
;; (winring-initialize)


;;;;;;;;;;;;;;;;
;; workgroups ;;
;;;;;;;;;;;;;;;;
(require 'workgroups)

;;(setq wg-prefix-key (kbd "C-c w"))
(setq wg-prefix-key (kbd "C-t"))

;; automatically save workgroups while kill-emacs
(setq wg-no-confirm t)
(defun my-workgroup-kill-emacs-hook ()
  ""
  (when (wg-current-workgroup t)
    (wg-update-all-workgroups-and-save)))
(add-hook 'kill-emacs-hook 'my-workgroup-kill-emacs-hook)

(workgroups-mode 1)

;; create "~/.emacs.d/var/workgroups" if not existed
(let ((wg-file-root (my-dotfile "var/workgroups/")))
  (unless (file-directory-p wg-file-root)
    (make-directory wg-file-root t)))

;; load workgroup if existed
(setq wg-file
      (my-dotfile "var/workgroups/wg-save"))
(when (file-exists-p wg-file)
  (wg-load wg-file))

(provide 'init_session)
;;; init_session.el ends here
