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

;;
;; Directory tree structure, see README.md
;;

;; 
(setq user-full-name "Le0n Zh4ng")
(setq user-mail-address "leoncamel@gmail.com")

;; -----
;; main
;; -----

;; global settings
(require 'init_global)

(require 'init_setenv)

(require 'init_keys)                    ;; Keyboard bindings
(require 'init_font_color)              ;; Font and color-theme
(require 'init_anything)                ;; Anything
(require 'init_session)                 ;; Session and desktop

(require 'init_fci)                     ;; fill-column-indicator mode

(require 'init_dired)
(require 'init_autocomplete)            ;; auto-complete mode
(require 'init_flymake)

(require 'init_magit)
(require 'init_tramp)

(require 'init_org)
(require 'init_markdown)

(require 'init_calendar)                ;; Japanese/Chinese Calendar

(require 'init_w3m)

(require 'init_lua)
(require 'init_clojure)
(require 'init_python)
(require 'init_ruby)
(require 'init_ocaml)
(require 'init_js)
(require 'init_haskell)

(require 'init_slime)

(require 'init_cpp)
(when mac-p
  (require 'init_objc))
(require 'init_cedet)

(require 'init_skeleton)
(require 'init_yasnippet)

(require 'init_autoinsert)

(provide 'init_main)
;;; init_main.el ends here
