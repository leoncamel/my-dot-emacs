;;; init_global.el --- init_global

;; Copyright (C) 2011  Le0n Zh4ng

;; Author: Le0n Zh4ng <leoncamel@gmail.com>
;; Keywords: tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at  option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 利用する環境共通の設定

;;; Code:

;;; 初期位置
;; (cd "~/")

;; ログの長さを無限に
;;(setq message-log-max 't)
;; ログを出さない
;; (setq message-log-max nil)

;; menu-bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; tool-bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; scroll-bar 
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(defalias 'yes-or-no-p 'y-or-n-p)

;; 警告を視覚的にする
(setq visible-bell t)

;; THIS is important to overwrite settings from starter-kit
;; (require 'starter-kit-misc)

;; ファイルを編集した場合コピーにてバックアップする
;; inode 番号を変更しない
(setq backup-by-copying t)
;;; バックアップファイルの保存位置指定[2002/03/02]
;; !path!to!file-name~ で保存される
(setq backup-directory-alist
      '(
        ;; ("^/etc/" . "~/.emacs.d/var/etc")
        ;; (".*" . "~/.emacs.d/var/emacs")
        (".*" . "~/.emacs.d/var/backups")
        ))

;; bookmarks
(setq bookmark-default-file
      (my-dotfile-var "bookmarks"))

;; bookmark+
(setq bmkp-bmenu-state-file
      (my-dotfile-var "emacs-bmk-bmenu-state.el"))
(setq bmkp-bmenu-commands-file
      (my-dotfile-var "emacs-bmk-bmenu-commands.el"))

;; places
(setq save-place-file
      (my-dotfile-var "places"))

;; smex-items
(setq smex-save-file
      (my-dotfile-var "smex-items"))

;; tetris score
(setq tetris-score-file
      (my-dotfile-var "tetris-scores"))

;; cookie path
(require 'url-cookie)
(setq url-cookie-file
      (my-dotfile-var "url-cookies"))

;; auto-save-list
(setq auto-save-list-file-prefix
      (my-dotfile-var "auto-save-list/.saves-"))

;; custom-file
(setq custom-file
      (my-dotfile-private "customize.el"))

(defun try-load-custom-file ()
  "load customize.el if the file existed."
  (if (file-exists-p custom-file)
      (load custom-file)))

;; emacsclient を利用するためにサーバ起動
;; サーバが起動していた場合は先に起動していた方を優先
(require 'server)
;; (unless (server-running-p) (server-start))
(when (and (functionp 'server-running-p) (not (server-running-p)))
  (server-start))

;; Frame を前面にする
(defun skt:raise-frame()
     (raise-frame (selected-frame))
     ;; キーボードフォーカスを選択しているFrameにする
     (x-focus-frame (selected-frame)))

(when window-system
  (progn
   (add-hook 'server-visit-hook 'skt:raise-frame)
   (add-hook 'find-file-hook 'skt:raise-frame)))

;; 起動時のmessageを表示しない
(setq inhibit-startup-message t)
;; scratch のメッセージを空にする
(setq initial-scratch-message nil)

;; 印刷の設定
(setq ps-multibyte-buffer 'non-latin-printer)

;; 自動改行関連
(setq-default auto-fill-mode nil)
(setq-default fill-column 300)
(setq text-mode-hook 'turn-off-auto-fill)

;; 削除ファイルをOSのごみ箱へ
;; (setq delete-by-moving-to-trash t)

;;; help key変更
;; BackSpaceをC-hに変更
;(load-library "obsolete/keyswap")
(global-set-key "\M-?" 'help-for-help)
;; keyswap は obsoleteなので以下の設定が良い
(global-set-key "\C-h" 'backward-delete-char)

;; 編集関連

;; モードラインにライン数、カラム数表示
(line-number-mode t)
(column-number-mode t)

;; リージョンを kill-ring に入れないで削除できるようにする
(delete-selection-mode t)

;; TAB はスペース 4 個ぶんを基本
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; 対応するカッコを色表示する
;; 特に色をつけなくてもC-M-p、C-M-n を利用すれば対応するカッコ等に移動できる
(show-paren-mode t)
;; カッコ対応表示のスタイル
;; カッコその物に色が付く(デフォルト)
(setq show-paren-style 'parenthesis)
;; カッコ内に色が付く
;; (setq show-paren-style 'expression)
;; 画面内に収まる場合はカッコのみ、画面外に存在する場合はカッコ内全体に色が付く
;; (setq show-paren-style 'mixed)

;; 動的略語展開で大文字小文字を区別
(setq dabbrev-case-fold-search nil)

;; 新規行を作成しない
;; emacs21ではデフォルトで設定されています。
(setq next-line-add-newlines nil)

;; スクロールのマージン
;; 指定した数字行だけスクロール
(setq scroll-conservatively 10000)
;; scroll-conservatively の古いバージョン。一行ずつスクロールする
(setq scroll-step 1)
;; 上端、下端における余白幅(初期設定 0)
;; (setq scroll-margin 10)
;; カーソル位置を変更しない
(setq scroll-preserve-screen-position t)
;; shell-mode において最後の行ができるだけウィンドウの一番下にくるようにする
(setq comint-scroll-show-maximum-output t)
;; C-v や M-v した時に以前の画面にあった文字を何行分残すか(初期設定 2)
;;(setq next-screen-context-lines 5)

;; TODO : set meta key for emacs-mac
(if (eq mac-option-modifier nil)
    (progn
      (setq mac-option-modifier 'meta)
      (setq mac-command-modifier 'hyper)))

;; uniquify buffer name
(eval-after-load "uniquify"
  '(progn
     (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
     ))
(require 'uniquify)

;; volatile-highlights
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; autopair ;; don't want global mode
;; (require 'autopair)
;; (autopair-global-mode)

;; whitespace mode
(setq whitespace-style '(face trailing lines-tail tabs))
(setq whitespace-line-column 80)

;; highlight-symbol
(require 'highlight-symbol)
(global-set-key [(control *)] 'highlight-symbol-at-point)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; time-stamp
(add-hook 'before-save-hook 'time-stamp)
(eval-after-load "time-stamp"
  '(progn
     (setq time-stamp-start "Last Update: ")
     (setq time-stamp-format "%04y-%02m-%02d@%02H:%02M")
     (setq time-stamp-end "$")
     (setq time-stamp-line-limit 10)))

;; 終了時に聞く
(setq confirm-kill-emacs 'y-or-n-p)

;; remove the kill-buffer confirmation
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(provide 'init_global)
;;; init_global.el ends here
