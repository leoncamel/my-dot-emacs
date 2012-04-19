
(require 'semantic)

(defun my-region-test (start end)
  "my-region-test"
  (interactive "rp")
  (let ((parsed-results (semantic-parse-region start end)))
    (set-buffer (get-buffer-create "tmp.dot"))
    (graphviz-dot-mode)
    (erase-buffer)
    (goto-char (point-max))
    
    (insert (prin1-to-string parsed-results))
    (insert "--------------------------------")
    (setq my-parse-result parsed-results)
    ;; (insert (prin1-to-string (semantic-tag parse-result :members)))
    ))


;;;;;;;;;;;
;; notes ;;
;;;;;;;;;;;

;; name
;; function: semantic-tag-name

;; members
;; function: semantic-tag-type-members

;;

;; ELISP> (mapcar 'semantic-tag-name
;;                (semantic-tag-type-members
;;                 (semantic-tag-class my-parse-result)))

;; ("header" "stack_size" "dirty" "sp" "stack")
