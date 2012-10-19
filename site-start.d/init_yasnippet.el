;;; init_yasnippet.el --- yasnippet settings

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

;; (setq yas/my-snippets-dir (my-dotfile-etc "my-yasnippets/"))
;; (yas/load-directory yas/my-snippets-dir)
;; (require 'dropdown-list)
;; (setq yas/prompt-functions '(yas/dropdown-prompt
;;                              yas/ido-prompt
;;                              yas/completing-prompt))

;;;;;;;;;;;;;;;;;;;;;;;;;
;; for latest yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'yasnippet)
(add-to-list 'yas/snippet-dirs (my-dotfile-etc "my-yasnippets/"))
(yas/global-mode 1)
(setq yas/my-snippets-dir (my-dotfile-etc "my-yasnippets/"))
(yas/load-directory yas/my-snippets-dir)

(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt
                             yas/ido-prompt
                             yas/completing-prompt))

(provide 'init_yasnippet)
;;; init_yasnippet.el ends here
