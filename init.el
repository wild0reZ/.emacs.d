;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; remove useless GUI items
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)

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
 '(package-selected-packages '(elisp-format magit evil-matchit evil-commentary evil-surround evil
					    use-package)))
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
