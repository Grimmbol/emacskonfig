;; Add MELPA archive
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Don't show the splash screen
(setq inhibit-startup-message t)

;; Visual stuff
(global-display-line-numbers-mode 1)
(load-theme 'modus-vivendi t)				
(set-face-attribute 'default nil :height 160)


;; Fancy dev environment mode
(global-ede-mode t)

;; Send auto save files to a common directory
(setq backup-directory-alist
          `(("." . ,(concat user-emacs-directory "backups"))))

;; Remap meta key so that alt can be used for keyboard purposes
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)
(setq mac-command-modifier nil)

;; Major mode adjustments
;; Typescript
(setq typescript-indent-level 2)

;; Javascript
(setq js-indent-level 2)

;; Tide
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(defun setup-custom-tide-keybinds ()
  (interactive)
  (local-set-key (kbd "C-x C-<mouse-1>") 'tide-jump-to-definition)
  )

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

;; hook in tide mode and keybinds
;; For typescript
(add-hook 'typescript-mode-hook 'setup-tide-mode)
(add-hook 'typescript-mode-hook 'setup-custom-tide-keybinds)

;; For javascript
(add-hook 'js-mode-hook 'setup-tide-mode)
(add-hook 'js-mode-hook 'setup-custom-tide-keybinds)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company tide web-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
