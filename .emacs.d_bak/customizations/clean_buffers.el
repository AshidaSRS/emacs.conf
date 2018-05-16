;; KILL BUFFERS by C#
;;; package -- None
;;; Commentary:

;;; Code:

(defun kill-buffers()
  (let (buffer buffers)
    (setq buffers (buffer-list))
    (dotimes (i (length buffers))
      (setq buffer (pop buffers))
      (if (not (string-equal (buffer-name buffer) "*scratch*")) (kill-buffer buffer) nil))))

(defun clean-buffers() "Kills oll buffers except `scratch' and `Messages'"
       (interactive)
       (if (yes-or-no-p "Do you really want to clean all buffers? ")
           (kill-buffers) nil))

(provide 'clean_buffers)
;;; clean_buffers.el ends here
