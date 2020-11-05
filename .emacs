;; General settings
;;
(setq standard-indent 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode 0)

(setq scroll-step 1)
(line-number-mode 1)
(column-number-mode 1)
(global-hl-line-mode 1)

(setq make-backup-files 0)
(setq auto-save-default 0)

(fset 'yes-or-no-p 'y-or-n-p)
(setq stack-trace-on-error t)

(global-auto-revert-mode t)
(show-paren-mode 1)
(setq show-paren-delay 0)

; interface
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-echo-area-message t)

(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
(setq linum-format "%d: ")

(display-time-mode 1)               ; enable display time in modeline
(setq display-time-24hr-format t
        display-time-day-and-date t)
(display-time)

;; Packages
;;
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
;(add-to-list 'package-archives '("stable" . "https://stable.melpa.org/packages/"))
;(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
;(add-to-list 'package-archives '("elpa" . "https://tromey.com/elpa/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package zenburn-theme :ensure t)
(use-package multishell :ensure t)
(use-package window-numbering :ensure t)
(use-package yaml-mode :ensure t)

;; Keybindings
;;
(global-set-key (kbd "C-<tab>") 'bury-buffer)
(global-set-key [8]  'delete-backward-char)     ; C-h backspace
(global-set-key (kbd "<f5>") 'whitespace-mode)
(global-set-key (kbd "<f6>") 'linum-mode)
(global-set-key (kbd "<f11>") 'previous-buffer)
(global-set-key (kbd "<f12>") 'next-buffer)
(global-set-key "\M- " 'multishell-pop-to-shell)

;; Modes
;;

;; YAML
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

