;;; init_tumblr.el --- tumblr settings

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

(add-to-list 'load-path (my-file-path-join dotfiles-dir "vendor/tumble.git/"))
(require 'tumble)

;; set api to https for secure posting
(setq tumble-api-url "https://www.tumblr.com/api/write")

;; (setq tumble-email    "")
;; (setq tumble-password "")
;; (setq tumble-url      "yourname.tumblr.com")
(try-load-custom-file)

(provide 'init_tumblr)
;;; init_tumblr.el ends here
