# File Sync Utility

A simple Bash script to synchronize files **both ways** between two directories. It ensures that the **most recently modified version** of each file is kept in both folders.

## Features

- Two-way sync between two directories
- Preserves the most recent version of each file
- Safe handling of file names with spaces or special characters
- Lightweight and uses only core Unix utilities

## Usage

```bash
./fileSyncUtility.sh <folderA> <folderB>
```

### Example:

```bash
./fileSyncUtility.sh ~/Documents/work ~/Backup/work
```

This command will:

- Copy newer files from `~/Documents/work` to `~/Backup/work`
- Copy newer files from `~/Backup/work` to `~/Documents/work`

## Requirements

- Bash shell (version 3 or higher)
- `cp`, `find`, and other core Unix utilities

## Notes

- Only regular files are synced (not directories or symlinks).
- Files with identical names are compared by modification time.
- If a file is missing in one folder, it will be copied from the other.

## License

MIT License
