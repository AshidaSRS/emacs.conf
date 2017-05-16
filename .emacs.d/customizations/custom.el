(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(coffee-tab-width 2)
 '(company-auto-complete t)
 '(company-auto-complete-chars nil)
 '(company-ghc-show-info t)
 '(company-global-modes t)
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 1)
 '(company-occurrence-weight-function (quote company-occurrence-prefer-closest-above))
 '(company-search-regexp-function (quote company-search-flex-regexp))
 '(company-selection-wrap-around t)
 '(company-show-numbers nil)
 '(company-tooltip-align-annotations nil)
 '(company-tooltip-flip-when-above t)
 '(company-tooltip-idle-delay 0.1)
 '(company-tooltip-margin 10)
 '(company-tooltip-minimum-width 10)
 '(company-tooltip-offset-display (quote scrollbar))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(delete-selection-mode t)
 '(ergoemacs-mode t)
 '(global-company-mode t)
 '(haskell-mode-hook
   (quote
    (turn-on-haskell-indent turn-on-haskell-doc interactive-haskell-mode)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(org-emphasis-alist
   (quote
    (("*" bold)
     ("/" italic)
     ("_" underline)
     ("=" org-verbatim verbatim)
     ("~" org-code verbatim)
     ("+"
      (:strike-through t)))))
 '(org-replace-disputed-keys nil)
 '(package-selected-packages
   (quote
    (csharp-mode pretty-symbols emojify haskell-emacs flycheck-ghcmod company-ghc ac-alchemist alchemist color-identifiers-mode helm-company company-web company-cmake elm-mode yaml-mode web-mode virtualenv use-package tagedit smex smartscan scss-mode rainbow-delimiters puml-mode projectile powerline plantuml-mode paredit ox-reveal org-bullets multi-term moe-theme magit lua-mode jedi ido-ubiquitous hydra helm-gtags helm-flyspell gtags go-mode go-autocomplete git-rebase-mode git-commit-mode ghc ggtags flycheck exec-path-from-shell ensime emmet-mode emacs-eclim darkokai-theme color-theme-sanityinc-tomorrow color-theme-modern coffee-mode clojure-mode-extra-font-locking auto-complete-c-headers auto-complete-auctex atom-dark-theme alect-themes ac-slime ac-ispell ac-helm ac-haskell-process ac-cider abyss-theme)))
 '(recentf-mode t)
 '(shift-select-mode nil)
 '(tegmacs-company t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-echo ((t nil)) t)
 '(company-scrollbar-fg ((t (:background "#515151"))))
 '(company-template-field ((t (:background "dim gray" :foreground "6699cc")))))
