;;-*- coding: utf-8 -*-
;; ############## font setting ###################
;; *ONLY* for windows
;; Usage:
;; Put this file into your load-path
;; and add following into your ~/.emacs file:
;;   (load "fontset-win")
;;   (huangq-fontset-courier 17)
;;
;; it uses Courier New 17 and 新宋体 20 by default
;; I suppose you have Courier New and 新宋体
;;
;; To change default font, add following lines in ~/.emacs:
;;   (load "fontset-win")
;;   (setq my-latin-font "Monaco")
;;   (setq my-latin-size 15)
;;   (huangq-set-font my-latin-size)
;;
;; OR:
;;   (huangq-fontset-monaco 15)
;;
;; To change the font size:
;;    M-x huangq-set-font <RET> FONT-SIZE
;; or press C-x <RET> s
;;
;; To change font:
;;    M-x huangq-fontset-monaco <RET>
;;
;; Following presets are available:
;; huangq-fontset-courier       ;; Courier New 
;; huangq-fontset-monaco        ;; Monaco
;; huangq-fontset-lucida        ;; Lucida Sans Typewriter 
;; huangq-fontset-consolas      ;; Consolas + 微软雅黑
;; huangq-fontset-consolas0     ;; Consolas + 新宋体
;; huangq-fontset-dejavu        ;; DejaVu Sans Mono
;;
;; Of course, you should download these fonts yourself
;;
;; Note: the frame size may change during the change of fontset!

(defvar my-latin-font "Courier New")
(defvar my-chinese-font "新宋体")
(defvar my-fontset "fontset-courier")

(defvar my-latin-size 17)
(defvar my-chinese-size 20)


(create-fontset-from-fontset-spec
 "-outline-Courier New-normal-r-*-*-17-97-96-96-c-*-fontset-courier")

(create-fontset-from-fontset-spec
 "-outline-Monaco-normal-r-*-*-15-*-96-96-c-*-fontset-monaco")

(create-fontset-from-fontset-spec
 "-outline-Lucida Sans Typewriter-normal-r-*-*-15-*-96-96-c-*-fontset-lucida")

(create-fontset-from-fontset-spec
 "-outline-DejaVu Sans Mono-normal-r-*-*-15-*-96-96-c-*-fontset-dejavu")

(create-fontset-from-fontset-spec
 "-outline-Consolas-normal-r-*-*-15-*-96-96-c-*-fontset-consolas")

;; TODO: add bitstream's "create-fontset-from-fontset-spec

(defun huangq-set-font (latin-size &optional chinese-size)
  (interactive "nLatin Font Size: ")
  (cond
   ((string= my-latin-font "Monaco")    
    (setq my-fontset "fontset-monaco"))
   ((string= my-latin-font "Lucida Sans Typewriter")
    (setq my-fontset "fontset-lucida"))
   ((string= my-latin-font "Consolas")
    (setq my-fontset "fontset-consolas"))
   ((string= my-latin-font "DejaVu Sans Mono")
    (setq my-fontset "fontset-dejavu"))
   ((string= my-latin-font "Courier New")
    (setq my-fontset "fontset-courier"))
   ((string= my-latin-font "Bitstream")
    (setq my-fontset "fontset-bitstream"))
   (t
    (setq my-fontset "fontset-courier")))
  (setq my-latin-size latin-size)
  ;; chinese-size is normally not same as latin-size
  (unless chinese-size      
    (setq chinese-size
          (if (string= my-latin-font "Consolas")
              (cond
               ((<= latin-size 20) (+ 1 latin-size))
               ((<= latin-size 33) (+ 3 latin-size))
               (t (+ 4 latin-size)))
          (cond
           ((<= latin-size 24) (+ 3 latin-size))
           ((<= latin-size 29)  (+ 5 latin-size))
           (t (+ 6 latin-size)))
          )))
  (setq my-chinese-size chinese-size)
  ;; the font-name format of 微软雅黑 might be different from 新宋体
  (let ((latin-font
         (format
          (concat "-outline-" my-latin-font "-*-*-*-*-%d-97-96-96-c-*-iso8859-1")
          latin-size))
        (chinese-font
         (format
          (if (string= my-chinese-font "微软雅黑")
;;           (decode-coding-string              
              (concat "-outline-" my-chinese-font "-*-r-*-*-%d-*-96-96-p-*-iso10646-1")
;;            'utf-8)
;;           (decode-coding-string              
            (concat "-outline-" my-chinese-font "-*-r-*-*-%d-*-96-96-c-*-iso10646-1")
;;            'utf-8)
            )
          chinese-size)))
    ;; set font for all charsets
    (set-fontset-font			
     my-fontset nil chinese-font nil 'prepend)
    (set-fontset-font
     my-fontset 'ascii latin-font nil 'prepend)
    (set-fontset-font
     my-fontset 'latin latin-font nil 'prepend)
    (set-fontset-font
     my-fontset 'kana chinese-font nil 'prepend)
    (set-fontset-font
     my-fontset 'han chinese-font nil 'prepend)
    (set-fontset-font
     my-fontset 'cjk-misc chinese-font nil 'prepend)
    (set-fontset-font
     my-fontset 'symbol chinese-font nil 'prepend)
    ;; use the font
    (set-default-font my-fontset)
    )
  (message "Current Latin font: %s, font size: %d, chinese font size: %d"
           my-latin-font my-latin-size my-chinese-size))

;; (set-fontset-font
;;  "fontset-consolas" 'han
;;  "-outline-微软雅黑-normal-r-*-*-16-*-96-96-p-*-iso10646-1" nil 'prepend)

(defun huangq-fontset-monaco (&optional size)
  (interactive "P")
  (setq my-latin-font "Monaco")
  (setq my-chinese-font "新宋体")
  (if size
      (setq my-latin-size size))
    ;;(setq my-latin-size 14))
  (huangq-set-font my-latin-size))

(defun huangq-fontset-lucida (&optional size)
  (interactive "P")
  (setq my-latin-font "Lucida Sans Typewriter")
  (setq my-chinese-font "新宋体")
  (if size
      (setq my-latin-size size))
    ;;(setq my-latin-size 15))
  (huangq-set-font my-latin-size))

(defun huangq-fontset-courier (&optional size)
  (interactive "P")
  (setq my-latin-font "Courier New")
  (setq my-chinese-font "新宋体")
  (if size
      (setq my-latin-size size))
    ;;(setq my-latin-size 17))
  (huangq-set-font my-latin-size))

(defun huangq-fontset-dejavu-song (&optional size)
  (interactive "P")
  (setq my-latin-font "DejaVu Sans Mono")
  (setq my-chinese-font "新宋体")  
  (if size
      (setq my-latin-size size))
    ;;(setq my-latin-size 15))
  (huangq-set-font my-latin-size))

(defun huangq-fontset-dejavu-msyh (&optional size)
  (interactive "P")
  (setq my-latin-font "DejaVu Sans Mono")
  ;(setq my-chinese-font "微软雅黑")
  (setq my-chinese-font "WenQuanYi Zen Hei Sharp")
  (if size
      (setq my-latin-size size))
    ;;(setq my-latin-size 15))
  (huangq-set-font my-latin-size))

(defun huangq-fontset-fixedsys (&optional size)
  (interactive "P")
  (setq my-latin-font "Fixedsys Excelsior 2.00")
  (setq my-chinese-font "新宋体")
  (when size
      (setq my-latin-size size)
      (setq my-chinese-size (+ 1 size)))
  (huangq-set-font my-latin-size my-chinese-size))

(defun huangq-fontset-consolas (&optional size)
  (interactive "P")
  (setq my-latin-font "Consolas")
  (setq my-chinese-font "微软雅黑")
  (when size
    (setq my-latin-size size))
  (huangq-set-font my-latin-size))

(defun huangq-fontset-consolas0 (&optional size)
  (interactive "P")
  (setq my-latin-font "Consolas")
  (setq my-chinese-font "新宋体")  
  (if size
      (setq my-latin-size size))
  (huangq-set-font my-latin-size))

(defun huangq-fontset-bitstream (&optional size)
  (interactive "P")
  (setq my-latin-font "Bitstream")
  (setq my-chinese-font "微软雅黑")
  (when size
    (setq my-latin-size size))
  (huangq-set-font my-latin-size))

(defun leon-fontset-dejvu-msyh (&optional size)
  (interactive "P")
  (setq my-latin-font "Bitstream")
  (setq my-chinese-font "微软雅黑")
  (when size
    (setq my-latin-size size))
  (set-default-font (concat "DejaVu Sans Mono-16"))
  (set-fontset-font (frame-parameter nil 'font)
                    'unicode '("Microsoft YaHei" . "unicode-bmp")) 
  (set-fontset-font (frame-parameter nil 'font)
                    'han '("Microsoft YaHei" . "unicode-bmp"))
  (set-fontset-font (frame-parameter nil 'font)
                    'symbol '("Microsoft YaHei"  . "unicode-bmp"))
  (set-fontset-font (frame-parameter nil 'font)
                    'cjk-misc '("Microsoft YaHei"  . "unicode-bmp"))
  (set-fontset-font (frame-parameter nil 'font)
                    'bopomofo '("Microsoft YaHei"  . "unicode-bmp"))
  )

;; Xiao-qiang's chinese font settings
;; reference:
;;  [1] : http://www.princeton.edu/~chaol/Emacs.html
;;  [2] : http://emacser.com/torture-emacs.htm
(defun qiang-font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

(defun qiang-make-font-string (font-name font-size)
  (if (and (stringp font-size) 
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

(defun qiang-set-font (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-font-size)
  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl)                         ; for find if
  (let ((en-font (qiang-make-font-string
                  (find-if #'qiang-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts)
                            :size chinese-font-size)))
 
    ;; Set the default English font
    ;; 
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute
     'default nil :font en-font)

    ;; Set Chinese font 
    ;; Do not use 'unicode charset, it will cause the english font setting invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        zh-font))))

(defun newleon-fontset-dejvu-msyh (&optional size)
  (interactive "P")
  (when size
    (setq my-latin-size size))

  (qiang-set-font
   '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New")
   (concat ":pixelsize=" (number-to-string my-latin-size))
   '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))
  )

(defun macleon-fontset-dejvu-hei2 (&optional size)
  (interactive "P")
  (when size
    (setq my-latin-size size))

  (qiang-set-font
   '("DejaVu Sans Mono" "Monospace" "Courier New") ":pixelsize=16"
   '("MS Gothic" "Microsoft YaHei"))
  )

(defun macleon-fontset-dejvu-hei (&optional size)
  (interactive "P")
  (when size
    (setq my-latin-font size))

  (create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
  (set-fontset-font "fontset-menlokakugo"
                    'unicode
                    ;(font-(setq  )pec :family "Hiragino Kaku Gothic ProN" :size 16)
                    (font-spec :family "Adobe Heiti Std" :size my-latin-font)
                    nil
                    'append)

  (add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))  ;; 実際に設定する場合
  )

;; TODO: for mac's jp,zh font settings
;;  [1] : http://sakito.jp/emacs/emacs23.html
;;  [2] : http://d.hatena.ne.jp/CortYuming/20100903/p1
;;  [3] : http://d.hatena.ne.jp/brainhack/20110106
;;
;; other references:
;;  [1] :
;;  https://gist.github.com/raw/393042/6c06b35e4d8a9cff60e09e4dddbf961336b48daf/25font.el
;;  [2] :
;;  https://gist.github.com/raw/393042/a207fb14b02d9536ffa5c396784b24e16fc6f63f/25font.el
;;  [3] :
;;  https://github.com/clairvy/localenv/blob/master/.emacs
;;  [4] :
;;  https://gist.github.com/393042

;; Chinese test string
;; 维基百科是一个内容自由、任何人都能参与、并有多种语言的百科全书协作
;; 计划。我们的目标是建立一个完整、准确和中立的百科全书。
;;
;; Japanese test string:
;; １２日の東京株式市場の日経平均株価は、前日の米国市場で株価が大きく
;; 下落した流れを引き継ぎ、３日ぶりに値下がりした。


(provide 'my-fontset-win)

