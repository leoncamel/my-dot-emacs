;;; init_cedet.el --- CEDET settings

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


;; reference :: http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html#sec5

;; (load-file
;;  (my-file-path-join dotfiles-dir "vendor/cedet.git/common/cedet.el"))

;; Disable global EDE (Project Management)
(global-ede-mode nil)

;; * This enables the database and idle reparse ePngines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; Enable SRecode (Template management) minor-mode.
(require 'srecode-map)
(global-srecode-minor-mode 1)

;; (require 'semantic-gcc)
;; (semantic-add-system-include "~/exp/include/boost_1_37" 'c++-mode)

(require 'semanticdb)
(global-semanticdb-minor-mode 1)

;; if you want to enable support for gnu global
(require 'semanticdb-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
;; (semantic-load-enable-primary-exuberent-ctags-support)


(provide 'init_cedet)
;;; init_cedet.el ends here
