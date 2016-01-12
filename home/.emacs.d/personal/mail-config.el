;;; bascht --- notmuch settings
;;; Commentary:
;;; notmuch and mail related settings

;;; Code:

(require 'notmuch)

(setq notmuch-address-command "/home/bascht/bin/address")
(notmuch-address-message-insinuate)
(setq notmuch-archive-tags '("-unread" "+archive"))
(add-hook 'message-setup-hook 'mml-secure-message-sign-pgpmime)
(autoload 'gnus-alias-determine-identity "gnus-alias" "" t)

(defun notmuch-unread () "Filter for unread and inboxed messages."
       (interactive)
       (notmuch-search "tag:unread and tag:inbox"))

(defun notmuch-search-toggle-flagged ()
  "Toggle flagged state on the current item."
  (lambda ()
    (interactive)
    (if (member "flagged" (notmuch-search-get-tags))
        (notmuch-search-tag (list (concat "+" "flagged"))))
    (notmuch-search-tag (list(concat "-" "flagged")))
    (notmuch-search-next-thread)))

(setq notmuch-crypto-process-mime t)
(setq notmuch-hello-sections
  (quote
   (notmuch-hello-insert-header notmuch-hello-insert-saved-searches notmuch-hello-insert-search notmuch-hello-insert-recent-searches notmuch-hello-insert-alltags notmuch-hello-insert-footer notmuch-hello-insert-inbox)))
(setq notmuch-message-headers (quote ("Subject" "To" "Cc" "Date" "Received")))
(setq notmuch-search-oldest-first nil)


(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "msmtp"
      user-full-name "Sebastian Schulze")

(setq message-sendmail-f-is-evil 't)
(setq message-sendmail-extra-arguments '("--read-envelope-from"))
(setq message-kill-buffer-on-exit t)

(setq mail-host-address "bascht.com")

;;; load mail-mode when starting up from mutt
(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist))

(add-hook 'mail-mode-hook 'turn-on-flyspell)
(add-hook 'mail-mode-hook 'turn-on-longlines)
(add-hook 'mail-mode-hook 'auto-fill-mode)

(provide 'mail-config)
;;; mail-config.el ends here
