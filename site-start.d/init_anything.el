;;; init_anything.el --- anything settings

;; Copyright (C) 2011,2012  Le0n Zh4ng

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

(require 'anything-config)
(setq anything-c-adaptive-history-file
      (my-dotfile-var "anything-c-adaptive-history"))

;;;;;;;;;;;;;;;;;;;
;; anything-grep ;;
;;;;;;;;;;;;;;;;;;;
(require 'anything-grep)
(setq anything-grep-goto-hook
      (lambda ()
        (when anything-in-persistent-action
          (anything-persistent-highlight-point (point-at-bol) (point-at-eol)))))

;;;;;;;;;;;;;;;;;;;;;;;
;; anything-complete ;;
;;;;;;;;;;;;;;;;;;;;;;;
(require 'anything-complete)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Anything keybindings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (global-set-key (kbd "C-x C-b") 'anything-buffers+)
;; (global-set-key (kbd "M-x") 'anything-M-x)
;; (global-set-key (kbd "C-;") 'anything)
;; (global-set-key (kbd "C-x C-f") 'anything-find-files)

(defalias 'ag 'anything-grep)
(defalias 'aff 'anything-find-files)

(provide 'init_anything)
;;; init_anything.el ends here
