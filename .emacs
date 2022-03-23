;;; .emacs -- initialization file for GNU Emacs.
;;; More initialization is done in default.el, which is loaded after ~/.emacs
;;; unless ~/.emacs sets inhibit-default-init to non-nil.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Don't print the copyright message when emacs starts up.
;;;(setq inhibit-startup-message t)

;;; Bind M-SPC to set the mark. Useful for PC terminal emulators that
;;; don't send a NUL for C-SPC.
;;;(global-set-key "\M-\ " 'set-mark-command)

;;; Put time and load average in status lines.
;;;(display-time)

;;; Bind the Backspace key to delete backwards. Most likely "\^H" or "\^?"
(global-set-key "\^H" 'delete-backward-char)

;;; Backup to a designated dir, mirroring the full path
;;; See http://xahlee.info/emacs/emacs/emacs_set_backup_into_a_directory.html

(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* (
        (backupRootDir "~/.emacs.d/backup/")
        (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, for example, “C:”
        (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
        )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath
  )
)

(setq make-backup-file-name-function 'my-backup-file-name)

;;; Preserve file creation dates when creating backups
;;; See http://xahlee.info/emacs/emacs/emacs_set_backup_into_a_directory.html
(setq backup-by-copying t)
