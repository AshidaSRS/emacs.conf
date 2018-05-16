(use-package alchemist
  :ensure t)

(use-package ac-alchemist
:ensure t
:config (add-hook 'elixir-mode-hook (lambda () (ac-alchemist-setup))))

(provide 'setup-elixir)
