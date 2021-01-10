;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; remove useless GUI items
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)
(setq display-line-numbers 'relative)

;; use-package
(unless (package-installed-p 'use-package) 
  (package-refresh-contents) 
  (package-install 'use-package))
(require 'use-package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(counsel-projectile projectile smartparens smartparens-config counsel swiper ivy ace-window elisp-format magit evil-matchit evil-commentary evil-surround evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; elisp-format
(use-package elisp-format 
  :ensure t)

;; evil
(use-package evil 
  :ensure t 
  :config (evil-mode 1))

(use-package evil-surround 
  :ensure t 
  :after (evil) 
  :config (global-evil-surround-mode 1))

;; Press % to jump between matched tags
(use-package evil-matchit 
  :ensure t 
  :after (evil) 
  :config (global-evil-matchit-mode 1))

;; gcc to comment whole line
;; gc to comment out the target of a motion
;; e.g. gcap to comment out a paragraph
;; more info on https://github.com/linktohack/evil-commentary
(use-package evil-commentary 
  :ensure t 
  :after (evil) 
  :config (evil-commentary-mode))

;; magit
(use-package magit 
  :ensure t)

;; ace-window
(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window))

;; swiper
(use-package swiper
  :ensure t)

;; counsel
(use-package counsel
  :ensure t)

;; ivy
(use-package ivy
  :ensure t
  :after (swiper)
  :diminish (ivi-mode . "")
  :bind
  (:map ivy-mode-map
	("C-'" . ivy-avy))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 10)
  (setq enable-recursive-minibuffers t)
  (global-set-key (kbd "C-s") 'swiper-isearch)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "M-y") 'counsel-yank-pop)
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  (global-set-key (kbd "C-c v") 'ivy-push-view)
  (global-set-key (kbd "C-c V") 'ivy-pop-view))

;; smartparens
(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Documenti/Projects")
    (setq projectile-project-search-path '("~/Documenti/Projects")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :ensure t
  :config (counsel-projectile-mode))
