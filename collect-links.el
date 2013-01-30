(define-minor-mode collect-links-mode
  "Minor mode for collecting links"
  nil
  " collect-links"
  collect-links-mode-keymap
  :global 1
  )

(defvar collect-links-mode-keymap (make-keymap) "collect-links-mode keymap.")
(define-key collect-links-mode-keymap (kbd "C-c M-l") 'collect-links)

(defun collect-links ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    
    (let ((urls '()))
      ;; Find unique URLs
      (while (re-search-forward "\\<\\(http\\|https\\|ftp\\|mailto\\|file\\|news\\|shell\\|elisp\\|doi\\|message\\|file\\+sys\\|file\\+emacs\\|bbdb\\|bibtex\\|docview\\|gnus\\|info\\|irc\\|mew\\|mhe\\|rmail\\|vm\\|wl\\):\\([^ 	\n()<>]+\\(?:([[:word:]0-9_]+)\\|\\([^[:punct:] 	\n]\\|/\\)\\)\\)"  nil t)
	(add-to-list 'urls (match-string-no-properties 0)))
      
      ;; Add to list adds to the front. So we need to reverse
      (setq urls (reverse urls))
      ;; Replace them with a number
      (let ((counter 1))
	(dolist (url urls)
	  (goto-char (point-min))
	  (while (search-forward url nil t)
	    (replace-match
	     (concat "[" (number-to-string counter) "]")))
	  (setq counter (+ 1 counter))))
      
      (goto-char (point-max))
      (newline 2)
      
      ;; Print the numbered list
      (let ((counter 1))
	(dolist (url urls)
	  (insert (concat "[" (number-to-string counter) "] " url))
	  (incf counter)
	  (newline))))))

(provide 'collect-links)
