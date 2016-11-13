(use-package company
  :ensure t
  :diminish company-mode
  :config
  (delete 'company-etags company-backends)
  (delete 'company-gtags company-backends))

(setq company-idle-delay 0.2)           
(setq company-minimum-prefix-length 1) 
(setq company-show-numbers nil)        

(lazy-unset-key
 '("TAB")
 company-mode-map)                      
(lazy-unset-key
 '("M-p" "M-n" "M-1"
   "M-2" "M-3" "M-4"
   "M-5" "M-6" "M-7"
   "M-8" "M-9" "M-0"
   "C-m")
 company-active-map)
(lazy-set-key
 '(
   ("M-h" . company-complete-common)   
   ("M-H" . company-complete-selection) 
   ("M-w" . company-show-location)      
   ("M-s" . company-search-candidates) 
   ("M-S" . company-filter-candidates)  
   ("M-," . company-select-next)        
   ("M-." . company-select-previous)  
   )
 company-active-map
 )
(dolist (hook (list
               'emacs-lisp-mode-hook
               'lisp-mode-hook
               'lisp-interaction-mode-hook
               'scheme-mode-hook
               'c-mode-hook
               'c++-mode-hook
               'java-mode-hook
               'haskell-mode-hook
               'asm-mode-hook
               'emms-tag-editor-mode-hook
               'sh-mode-hook
               'python-mode-hook
               'scala-mode-hook
               'elixir-mode-hook
               ))
  (add-hook hook 'company-mode))

(provide 'company-settings)
