;;; mew-rc.el --- dot.mew settings

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

(require 'mew-vars)

(setq mew-name "Leon Zhang") ;; (user-full-name)
(setq mew-user "leoncamel@gmail.com") ;; (user-login-name)

;; (setq mew-mail-domain "domain of e-mail address")
(setq mew-config-alist
      ;;Gmail
      '(
        ("default"
         (name	. "leoncamel")
         (user	. "leoncamel")
         (mail-domain . "gmail.com")
         (proto . "%")
         (imap-server	. "imap.gmail.com")
         ;; ("imap-ssh-server"	. "SSH server address")
         (imap-user	. "leoncamel@gmail.com")
         (imap-size	. 0)
         (imap-delete . t)
         (imap-ssl . t)
         (imap-ssl-port . 993)
         (imap-queue-folder . "%queue")
         (imap-trash-folder . "%INBOX.Trash") ;; This must be in concile with your IMAP box setup
         (imap-header-only . t)
         (ssl-verify-level . 0)
         (smtp-ssl	. t)
         (smtp-ssl-port. "465")
         (smtp-auth-list . ("PLAIN" "LOGIN" "CRAM-MD5"))
         (smtp-user	. "leoncamel@gmail.com")
         (smtp-server	. "smtp.gmail.com")
         )
        ))


(provide 'mew-rc)
;;; mew-rc.el ends here
