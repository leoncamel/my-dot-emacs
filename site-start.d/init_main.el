;;; init_main.el --- main

;; Copyright (C) 2011  Le0n Zh4ng

;; Author: Le0n Zh4ng <leoncamel@gmail.com>
;; Keywords: tools

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

;; Directory
;;
;; ~/.emacs.d/
;; ├── abbrev_defs
;; ├── auto-save-list
;; ├── backups
;; ├── bin
;; ├── elpa
;; ├── etc
;; ├── hostconfigs
;; ├── init.el
;; ├── private
;; ├── share
;; ├── site-start.d
;; │   └── init_main.el
;; ├── userconfigs
;; ├── var
;; └── vendor
;;

;; 
(setq user-full-name "Le0n Zh4ng")
(setq user-mail-address "leoncamel@gmail.com")

;; 

;; start emacs server
(server-start)

;; remove the kill-buffer confirmation
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Font
(require 'my-plat-vars)
(require 'my-fontset-win)
(if window-system
    (cond
     (linux-p
      (newleon-fontset-dejvu-msyh 16))
     (darwin-p
      (macleon-fontset-dejvu-hei 16))
     (t
      (newleon-fontset-dejvu-msyh 16))))

(provide 'init_main)
;;; init_main.el ends here
