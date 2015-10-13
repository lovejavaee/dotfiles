;;; bascht --- all the looks
;;; Commentary:
;;; All the looks

;;; Code:

(load-theme 'monokai t nil)
(rainbow-mode 1)
(rainbow-delimiters-mode)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(defun on-after-init () "Don't set a background for -nw Emacs."
       (unless (display-graphic-p (selected-frame))
         (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(if (display-graphic-p)
    '(progn
       '(menu-bar-mode)
       (custom-set-faces
        '(mode-line ((t (:background "#85C" :foreground "#85CEEB" :box (:line-width 1 :color "dodger blue")))))
        )

       (custom-set-faces
        '(mode-line ((t (:background "brightblack" :foreground "#4e4e4e" :box (:line-width 1 :color "dodger blue")))))
        )))

;;; Nice Org alert boxes
(setq alert-default-style 'libnotify)

(provide 'appearance-config)
;;; appearance-config.el ends here
