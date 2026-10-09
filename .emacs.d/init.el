;; -*- lexical-binding: t; -*-

;;;; Code:
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(recentf-mode t)
(savehist-mode 1)

(global-hl-line-mode 1)
(global-display-line-numbers-mode 1)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)
(setq js-indent-level 2)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'org)
(straight-use-package 'use-package)

(add-to-list 'default-frame-alist
						 '(font . "AtkynsonMono Nerd Font Mono-11"))

;; (-package ef-themes
;; 	:straight t
;; 	:config
;; 	(setq modus-themes-mixed-fonts t)
;; 	(setq modus-themes-italic-constructs t)
;; 	(modus-themes-load-theme 'ef-maris-dark))

(use-package doom-themes
  :straight t
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (setq doom-everforest-background "medium")
  (load-theme 'doom-monokai-machine t)

  (doom-themes-visual-bell-config)
  (doom-themes-org-config))


(use-package meow
  :straight t)

(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-define-key
   '("j" . meow-next)
   '("k" . meow-prev)
   '("<escape>" . ignore))
  (meow-leader-define-key
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("?" . meow-cheatsheet)
   
   ;; Window bindings
   '("w d" . delete-window)
   '("w v" . split-window-right)
   '("w s" . split-window-below)
   
   ;; Files
   '("/" . consult-ripgrep)
   '("f r" . consult-recent-file)

   ;; Buffer
   '("," . consult-buffer)
   '("b d" . (lambda () (interactive) (kill-buffer (current-buffer))))
   '("b l" . (lambda () (interactive) (switch-to-buffer nil)))
   '("b b" . switch-to-buffer)
   '("b n" . next-buffer)
   '("b i" . ibuffer)

   ;; Org
   '("n j" . org-journal-new-entry)

   ;; navigation
  
   )
  
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . (lambda () (interactive) (end-of-line) (meow-insert)))
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . flash-jump)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . eldoc-box-help-at-point)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("o" . meow-open-below)
   '("O" . meow-open-above)
   '("p" . meow-yank)
   '("P" . clipboard-yank)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   ;; '("z" . meow-pop-selection)
   '("z o" . kirigami-open-fold)          ; Open fold at point
   '("z O" . kirigami-open-fold-rec)      ; Open fold recursively
   '("z r" . kirigami-open-folds)         ; Open all folds
   '("z c" . kirigami-close-fold)         ; Close fold at point
   '("z m" . kirigami-close-folds)        ; Close all folds
   '("z a" . kirigami-toggle-fold)      ; Toggle fold at point

   '("'" . repeat)
   '("/" . consult-line)
   '("<escape>" . ignore)))
;; (require 'meow)
(meow-setup)
(meow-global-mode 1)

;; Eval region
(global-set-key (kbd "C-x C-r") #'eval-region)

;; Window movement
(global-set-key (kbd "C-<left>") #'windmove-left)
(global-set-key (kbd "C-<right>") #'windmove-right)
(global-set-key (kbd "C-<down>") #'windmove-down)
(global-set-key (kbd "C-<up>") #'windmove-up)

;; File operations
(global-set-key (kbd "C-s") #'save-buffer)
(global-set-key (kbd "C-r") #'undo-tree-redo)

(require 'org-protocol)

(setq org-hide-emphasis-markers t)
(use-package org-journal
  :straight t
  :config
  (setq org-journal-dir "~/org/journal")
  (setq org-journal-enable-agenda-integration t)
  (setq org-journal-file-type 'daily))
  
(defun org-journal-save-entry-and-exit()
  "Simple convenience function.
  Saves the buffer of the current day's entry and kills the window
  Similar to 'org-capture' like behavior"
  (interactive)
  (save-buffer)
  (kill-buffer-and-window))
  
(define-key org-journal-mode-map (kbd "C-x C-s") 'org-journal-save-entry-and-exit)

(use-package consult
  :straight t)

(use-package vertico
  :straight t
	:init
	(vertico-mode)
	(add-hook 'rfn-eshadow-update-overlay-hook #'vertico-directory-tidy))

(use-package marginalia
  :straight t
  :init
  (marginalia-mode))

(use-package orderless
  :straight t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t)) ;; emacs 31: partial completion behaves like substring

(use-package corfu
  :straight t
	:custom
	(corfu-auto t)
	(corfu-preselect 'prompt)
	 :bind
  (:map corfu-map
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("S-TAB" . corfu-previous)
        ([backtab] . corfu-previous))
  :init
  (global-corfu-mode)
	:config
	(keymap-unset corfu-map "RET")
	)

;; A few more useful configurations...
(use-package emacs
	:straight t
  :custom
  ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)
  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))

(use-package cape
  :straight t
  :defer 1
  :config
  (add-hook 'completion-at-point-functions #'cape-dabbrev 20) ; words from buffer
  (add-hook 'completion-at-point-functions #'cape-file 20))

(use-package eglot
  :straight t
  :ensure nil
  :functions (eglot-ensure)
  :commands (eglot)
  :hook (prog-mode . eglot-ensure)
  :config
  (set-face-attribute 'eglot-highlight-symbol-face nil
    :foreground "#00ccff"
    :underline t))

(use-package flycheck
  :straight t
	:hook ((after-init . global-flycheck-mode)
		;; show diagnostics inline, next to tthe code
		(after-init . global-flycheck-annotate-mode))
  :config
  (global-flycheck-eglot-mode 1))


(use-package kind-icon
  :straight t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)
	;; fix overly large icons (https://github.com/jdtsmith/kind-icon/issues/22)
	(setq kind-icon-default-style
      '(:padding -1 :stroke 0 :margin 0 :radius 0 :height 0.4 :scale 1)))

(use-package pdf-tools
	:straight t
	:init
	(pdf-tools-install))

(add-hook 'pdf-view-mode-hook (lambda() (display-line-numbers-mode -1)))

;; (use-package saveplace-pdf-view
;; 	:straight t)
;; (require 'saveplace-pdf-view)
;; (save-place-mode 1)
(use-package org-noter
   :straight
    (:repo "org-noter/org-noter"
        :host github
        :type git
        :files ("*.el" "modules/*.el"))
		:init
		(setq org-noter-auto-save-last-location 1)
		(setq org-noter-always-create-frame nil))

(use-package ghostel
	:straight t
  :init
  (setopt ghostel-keymap-exceptions '("C-c" "C-x" "C-u" "C-h" "M-x" "M-:" "C-\\" "C-<left>" "C-<up>" "C-<down>" "C-<right>")))
  

(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(setq delete-by-moving-to-trash t)
(setq dired-dwim-target t)

(use-package all-the-icons
	:straight t
	:if (display-graphic-p))

(use-package all-the-icons-dired
	:straight t)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(use-package org-download
	:straight t
	:config
	(setq org-download-method 'directory)
  (setq-default org-download-image-dir "~/org/attachments/"))

(use-package meow-ghostel
  :straight (meow-ghostel :type git :host github :repo "dakra/meow-ghostel")
  :after (ghostel meow)
  :hook (ghostel-mode . meow-ghostel-mode))
  ;; :vc (:url "https://github.com/dakra/meow-ghostel" :rev :newest)
  ;; :after (ghostel meow)
  ;; :hook (ghostel-mode . meow-ghostel-mode))

(use-package flash
  :straight t
  :custom
  (flash-multi-window nil))

(use-package kirigami
  :straight t
  :commands (kirigami-open-fold
             kirigami-open-fold-rec
             kirigami-close-fold
             kirigami-toggle-fold
             kirigami-open-folds
             kirigami-close-folds-except-current
             kirigami-close-folds)

  :bind
  ;; Vanilla Emacs keybindings
  (("C-c z o" . kirigami-open-fold)          ; Open fold at point
   ("C-c z O" . kirigami-open-fold-rec)      ; Open fold recursively
   ("C-c z r" . kirigami-open-folds)         ; Open all folds
   ("C-c z c" . kirigami-close-fold)         ; Close fold at point
   ("C-c z m" . kirigami-close-folds)        ; Close all folds
   ("C-c z a" . kirigami-toggle-fold)))      ; Toggle fold at point

(add-hook 'emacs-lisp-mode-hook #'outline-minor-mode)
(add-hook 'lisp-interaction-mode-hook #'hs-minor-mode) ; scratch
(add-hook 'lisp-mode-hook #'outline-minor-mode)
(add-hook 'conf-mode-hook #'outline-minor-mode)
(add-hook 'markdown-mode-hook #'outline-minor-mode)
(add-hook 'diff-mode-hook #'outline-minor-mode)

(use-package outline-indent
  :straight t
  :commands outline-indent-minor-mode
  :custom
  (outline-indent-ellipsis " ▼"))

;; Python
(add-hook 'python-mode-hook #'outline-indent-minor-mode)
(add-hook 'python-ts-mode-hook #'outline-indent-minor-mode)

;; Yaml
(add-hook 'yaml-mode-hook #'outline-indent-minor-mode)
(add-hook 'yaml-ts-mode-hook #'outline-indent-minor-mode)

(use-package treesit-auto
  :straight t
  :config
  (global-treesit-auto-mode))
  
(use-package treesit-fold
  :straight t
  :commands (treesit-fold-close
             treesit-fold-close-all
             treesit-fold-open
             treesit-fold-toggle
             treesit-fold-open-all
             treesit-fold-mode
             global-treesit-fold-mode
             treesit-fold-open-recursively
             treesit-fold-line-comment-mode)

  :custom
  (treesit-fold-line-count-show t)
  (treesit-fold-line-count-format " ▼")

  :config
  (set-face-attribute 'treesit-fold-replacement-face nil
                      :foreground "#808080"
                      :box nil
                      :weight 'bold))

;; Systems and General Purpose
(add-hook 'c-ts-mode-hook #'treesit-fold-mode)
(add-hook 'c++-ts-mode-hook #'treesit-fold-mode)
(add-hook 'java-ts-mode-hook #'treesit-fold-mode)
(add-hook 'rust-ts-mode-hook #'treesit-fold-mode)
(add-hook 'go-ts-mode-hook #'treesit-fold-mode)
(add-hook 'ruby-ts-mode-hook #'treesit-fold-mode)
(add-hook 'php-ts-mode-hook #'treesit-fold-mode)
(add-hook 'csharp-ts-mode-hook #'treesit-fold-mode)
(add-hook 'go-mod-ts-mode-hook #'treesit-fold-mode)
(add-hook 'lua-ts-mode-hook #'treesit-fold-mode)

;; Web and Frontend
(add-hook 'js-ts-mode-hook #'treesit-fold-mode)
(add-hook 'js-ts-mode-hook #'treesit-fold-mode)
(add-hook 'typescript-ts-mode-hook #'treesit-fold-mode)
(add-hook 'tsx-ts-mode-hook #'treesit-fold-mode)
(add-hook 'css-ts-mode-hook #'treesit-fold-mode)
(add-hook 'html-ts-mode-hook #'treesit-fold-mode)
(add-hook 'heex-ts-mode-hook #'treesit-fold-mode)
(add-hook 'xml-ts-mode-hook #'treesit-fold-mode)

;; Scripting and Infrastructure
(add-hook 'bash-ts-mode-hook #'treesit-fold-mode)
(add-hook 'cmake-ts-mode-hook #'treesit-fold-mode)
(add-hook 'dockerfile-ts-mode-hook #'treesit-fold-mode)
(add-hook 'awk-ts-mode-hook #'treesit-fold-mode)
(add-hook 'vimscript-ts-mode-hook #'treesit-fold-mode)
(add-hook 'nix-ts-mode-hook #'treesit-fold-mode)

;; Data and Configuration
(add-hook 'json-ts-mode-hook #'treesit-fold-mode)
(add-hook 'toml-ts-mode-hook #'treesit-fold-mode)

;; Build Systems and Makefiles
(add-hook 'makefile-ts-mode-hook #'treesit-fold-mode)

;; Hardware Description and Shaders
(add-hook 'verilog-ts-mode-hook #'treesit-fold-mode)
(add-hook 'vhdl-ts-mode-hook #'treesit-fold-mode)
(add-hook 'hlsl-ts-mode-hook #'treesit-fold-mode)

;; Scientific, Data Science, and Academic
(add-hook 'latex-ts-mode-hook #'treesit-fold-mode)
(add-hook 'beancount-ts-mode-hook #'treesit-fold-mode)

;; Documentation and Diagrams
(add-hook 'markdown-ts-mode-hook #'treesit-fold-mode)
(add-hook 'mermaid-ts-mode-hook #'treesit-fold-mode)
 
;; Other
(add-hook 'gdscript-ts-mode-hook #'treesit-fold-mode)
(add-hook 'clojure-ts-mode-hook #'treesit-fold-mode)
(add-hook 'caml-ts-mode-hook #'treesit-fold-mode)
(add-hook 'ocaml-ts-mode-hook #'treesit-fold-mode)
(add-hook 'erlang-ts-mode-hook #'treesit-fold-mode)
(add-hook 'elixir-ts-mode-hook #'treesit-fold-mode)
(add-hook 'scala-ts-mode-hook #'treesit-fold-mode)
(add-hook 'dart-ts-mode-hook #'treesit-fold-mode)
(add-hook 'haskell-ts-mode-hook #'treesit-fold-mode)
(add-hook 'julia-ts-mode-hook #'treesit-fold-mode)
(add-hook 'kotlin-ts-mode-hook #'treesit-fold-mode)
(add-hook 'gleam-ts-mode-hook #'treesit-fold-mode)
(add-hook 'noir-ts-mode-hook #'treesit-fold-mode)
(add-hook 'swift-ts-mode-hook #'treesit-fold-mode)
(add-hook 'zig-ts-mode-hook #'treesit-fold-mode)

(use-package eldoc-box
  :straight t
  ;; :hook (eglot-managed-mode . eldoc-box-hover-at-point-mode)
  :custom
  (eldoc-echo-area-use-multiline-p nil) ; suppress echo area, box only
  (eldoc-box-max-pixel-width        400)
  (eldoc-box-max-pixel-height       300)
  (eldoc-box-only-multi-line        t)
  (eldoc-box-cleanup-interval       0.5)
  (eldoc-box-fringe-use-same-bg     t))
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3613617b9953c22fe46ef2b593a2e5bc79ef3cc88770602e7e569bbd71de113b"
     "4dcf06273c9f5f0e01cea95e5f71c3b6ee506f192d75ffda639d737964e2e14e"
     "c9f5074c49ede3926c978c427f72f98bed6407e392bee8a5b5a49067a3959c79"
     "3d9f2f0479eb90d6a3eb6cecc2599199ff03aa4163b2db6608d644be7080740f"
     default))
 '(org-agenda-files
   '("/home/nesk/org/agenda.org" "/home/nesk/org/journal/20260919")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
