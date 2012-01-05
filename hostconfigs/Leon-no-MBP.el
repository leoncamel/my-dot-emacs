;;; Leon-no-MBP.el --- hostconfigs for host Leon-no-MBP

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

(require 'init_setenv)

;; (prepend-exec-path "/usr/local/bin/")
;; (prepend-exec-path "~/bin/homebrew/bin")

;; executable path priority in *reverse* order
(setq my-exec-path
      (reverse
       '(
         ;; High Priority ;;
         "~/bin/"
         ;; texlive 2011
         "/usr/local/texlive/2011/bin/x86_64-darwin/"
         ;; homebrew
         "~/bin/homebrew/bin/"
         "~/bin/homebrew/sbin/"
         ;; macports
         "/opt/local/bin/"
         "/opt/local/sbin/"
         ;;
         "/usr/local/bin/"
         ;; Low Priority ;;
         )))

(dolist (p my-exec-path)
  (prepend-exec-path p))

;; (setq my-exec-path
;;       (reverse
;;        '("/Users/leoncamel/bin/homebrew/bin"
;;          "/usr/local/texlive/2011/bin/x86_64-darwin/"
;;          "/Users/leoncamel/bin/homebrew//sbin"
;;          "/Users/leoncamel/bin/homebrew//bin"
;;          "/Users/leoncamel/.nvm/v0.5.10/bin"
;;          "/Users/leoncamel/.rvm/gems/ruby-1.8.7-p334/bin"
;;          "/Users/leoncamel/.rvm/gems/ruby-1.8.7-p334@global/bin"
;;          "/Users/leoncamel/.rvm/rubies/ruby-1.8.7-p334/bin"
;;          "/Users/leoncamel/.rvm/bin"
;;          "/Users/leoncamel/bin/erlang-r14b04-by-kerl//bin"
;;          "/Users/leoncamel/bin/cmigemo//bin"
;;          "/Users/leoncamel/bin/AllegroCL/"
;;          "/Users/leoncamel/bin/GoogleAppEngine/"
;;          "/Users/leoncamel/bin/Wireshark_CMD/"
;;          "/Users/leoncamel/bin/depot_tools"
;;          "/Users/leoncamel/bin/plowshare-svn//bin"
;;          "/Users/leoncamel/bin/cmucl-20b//bin"
;;          "/Users/leoncamel/bin/proxytunnel-1.9.0//bin"
;;          "/Users/leoncamel/Library/Haskell/bin"
;;          "/opt/local//sbin"
;;          "/opt/local//bin"
;;          "/Users/leoncamel/bin/"
;;          "/usr/local/bin/"
;;          "/usr/local/cuda/bin")))


(provide 'Leon-no-MBP)
;;; Leon-no-MBP.el ends here
