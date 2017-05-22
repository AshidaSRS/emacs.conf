;; (use-package scala-mode
;;   :pin melpa
;;   :mode ("\\.scala\\'". scala-mode)
;;   )

;; (use-package sbt-mode
;;   :pin melpa
;; ;;  :mode (("\\.scala\\'". ensime-mode))
;;   )
;; (use-package ensime
;;   :ensure t
;;   :config
;;   (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;;   :bind ("C-c C-e" . eval-scala)
;; ;;  :mode ("\\.scala\\'". ensime-mode)
;;   )
(require 'ensime)
(require 'scala-mode)
(require 'sbt-mode)

(add-to-list 'exec-path "/usr/local/bin")

(defun eval-scala (start end)
  (interactive (list (point) (mark)))
  ;; start scala if it hasn't started yet
  (unless (get-process "scala-repl")
    (let ((process-connection-type nil))  ; use a pipe
      (start-process "scala-repl" "*scala*"  "scala"))
    (set-buffer "*scala*")
    (special-mode))
  ;; execute
  (process-send-region "scala-repl" start end)
  (process-send-string "scala-repl" "\n")
  ;;display buffer
  (display-buffer
   (get-buffer "*scala*")
   '((display-buffer-reuse-window
      display-buffer-pop-up-window
      display-buffer-pop-up-frame)
     (reusable-frames . 0)
     (window-height . 8) (window-width . nil))))


(setq ensime-startup-snapshot-notification nil)
(setq scala-prettify-symbols
  '(
    ("=>" . ?⇒)
    ("<-" . ?←)
    ("->" . ?→)
    ("<<<" . ?⋘)
    (">>>" . ?⋙)
    ("any" . ?∃)
    ("all" . ?∀)
    ("traverse" . ?↦)
    ("lambda" . ?λ)
    ("alpha" . ?α)
    ("beta" . ?β)
  ))

(add-hook 'scala-mode-hook
  (lambda ()
    (ensime-scala-mode-hook)
    (setq prettify-symbols-alist scala-prettify-symbols)
    (prettify-symbols-mode)
    (define-key scala-mode-map (kbd "C-x M-e") 'ensime-fully-reload)
  ))

;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;; (setq prettify-symbols-alist scala-prettify-symbols)
;; (add-hook 'scala-mode-hook 'prettify-symbols-mode)

(defun ensime-fully-reload ()
  "reload ensime"
  (interactive)
  (ensime-shutdown)
  (ensime))

(provide 'scala-settings)
