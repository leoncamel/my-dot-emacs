;;; init_occur.el --- occur related settings

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

(require 'color-moccur)

;; 別ウィンドウで該当ファイルを開かない。エンターした場合にだけ開く
(setq moccur-grep-following-mode-toggle nil)

(require 'loccur)
;; defines shortcut for loccur of the current word
(global-set-key (kbd "C-%") 'loccur-current)

;; defines shortcut for the interactive loccur command
;; (global-set-key (kbd "C-*") 'loccur)

;; defines shortcut for the loccur of the previously found word
;; (global-set-key (kbd "C-*") 'loccur-previous-match)
;; (define-key global-map [(control shift o)] 'loccur-previous-match)

;; occur
(global-set-key (kbd "C-c o")   'occur)

(provide 'init_occur)
;;; init_occur.el ends here
