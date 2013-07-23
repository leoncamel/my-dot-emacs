;;; init_font_color.el --- fonts and color settings

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Font
(require 'my-plat-vars)
(require 'my-fontset-win)
(if window-system
    (cond
     (linux-p
      (newleon-fontset-dejvu-msyh 16))
     (darwin-p
      ;; (macleon-fontset-dejvu-hei 16)
      (macleon-fontset-melon-msyh 16)
      )
     (t
      (newleon-fontset-dejvu-msyh 18))))


;; color-theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color theme
;; (add-to-list 'load-path (my-dotfile-vendor "color-theme"))
;; (color-theme-initialize)
;;; (color-theme-dark-laptop)
;(add-to-list 'load-path (my-dotfile-vendor "color-theme-by-leon/"))
;(require 'color-theme-tangotango)
;(require 'color-theme-blackboard)
;(require 'color-theme-blackboard-xiaoqiang)
;(color-theme-blackboard-xiaoqiang)
;(require 'solarized-theme)

;;
;; new color-theme settings
;; for color-theme-6.6.1 downloaded from package.el
;;
(require 'color-theme)
(setq color-theme-initialized t)

;; optional : load old color-theme-6.6.0's color-theme-library
;; (load-file
;;     (my-dotfile-vendor "color-theme/themes/color-theme-library.el"))
;; (color-theme-dark-laptop)

;; After I uploaded the "color-theme-library", my favorite color-theme comes back.
(require 'color-theme-library)
;; (color-theme-dark-laptop)

;; sunburst
(add-to-list 'load-path
             (my-dotfile-vendor "Emacs-Sunburst-Color-Theme.git/"))
(require 'color-theme-sunburst)
;; (color-theme-sunburst)
(require 'color-theme-sunburst-new)
;; (color-theme-sunburst-new)

(require 'color-theme-solarized)
;; (setq solarized-contrast 'high)
;; (color-theme-solarized-dark)

(require 'color-theme-sanityinc-solarized)
;; (color-theme-sanityinc-solarized-dark)

(require 'color-theme-blackboard)
;; (color-theme-blackboard)

;; (require 'color-theme-wombat+)
;; (color-theme-wombat+)

(add-to-list 'load-path
             (my-dotfile-vendor "color-theme-wombat-dark.git/"))
(require 'color-theme-wombat-dark)
(color-theme-wombat-dark)

;; (require 'color-theme-zenburn)
;; (color-theme-zenburn)

;; (require 'color-theme-tango)
;; (color-theme-tango)

(provide 'init_font_color)
;;; init_font_color.el ends here
