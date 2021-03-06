(use-package elm-mode
  :ensure t
  :config
  (add-hook 'elm-mode-hook #'elm-oracle-setup-completion)
  (package-require 'company)
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-ghc))
  (add-hook 'elm-mode-hook #'elm-oracle-setup-ac))

(use-package flycheck-elm
  :ensure t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-elm-setup))
