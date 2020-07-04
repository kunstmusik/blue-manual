# AutoBackup and Recovery

Temporary backups of open projects are generated every minute for
projects which have previously been saved to disk (new projects not yet
saved are not backed up). If Blue quits unexpectedly, those files will
remain, otherwise on normal closing of the file they are deleted. If on
opening a file a backup if found with a date newer than the original
file, the option to open from the backup or the original is given.

If the backup is chosen, it is required to use "Save As" to save over
the original file or to a new file. At that point the backup is deleted.

If the original file is chosen, then the backup file will be overwritten
the next time the autobackup thread runs.
