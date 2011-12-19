;;; init_font_color.el --- fonts and color settings

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

;; color-theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color theme
(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))
(require 'color-theme)
(color-theme-initialize)
;(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme-by-leon/"))
;(require 'color-theme-tangotango)
;(require 'color-theme-blackboard)
;(require 'color-theme-blackboard-xiaoqiang)
;(color-theme-blackboard-xiaoqiang)
(color-theme-dark-laptop)
;(require 'solarized-theme)
;(color-theme-solarized-dark)
;(eval-after-load 'color-theme '(print "LEON : loaded solarized-theme"))


(provide 'init_font_color)
;;; init_font_color.el ends here