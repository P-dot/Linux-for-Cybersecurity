# Linux for Cybersecurity

**Hands-on Linux security engineering laboratory series** · [P-dot](https://github.com/P-dot)

A structured, evidence-driven collection of reproducible experiments based on the chapter progression of **William Rothwell and Denise Kinsey, _Linux Essentials for Cybersecurity_**. The emphasis is on understanding what Linux commands really do, validating assumptions on a dedicated Kali Linux VM, and recording observed outcomes rather than relying on screenshots without explanation.

> Independent educational lab notes; not affiliated with, sponsored by, or a reproduction of Pearson's textbook. Commands and explanations are independently written. Work only on systems you own or are authorized to assess.

## Lab index

| Lab | Book coverage | Focus | Status |
| --- | --- | --- | --- |
| [Lab 01 — Linux Foundations & Command-Line Investigation](labs/lab-01-linux-fundamentals-command-line/README.md) | Chapter 1: Distributions and Key Components; Chapter 2: Working on the Command Line | Linux identity, files, shells, search, BRE/ERE, `grep`, `sed`, archive basics | **Completed / evidence recorded** |
| [Lab 02 — Archiving and Compression: tar, gzip & gunzip](labs/lab-02-archiving-gzip-gunzip/README.md) | Chapter 2: Compression Commands | Archiving, comparison, compression, recovery and SHA-256 validation | **Completed / 13 original screenshots** |
| Lab 03 — bzip2 and Remaining Compression Tools | Chapter 2: Compression Commands | Remaining compression utilities in the textbook sequence | Planned |
| Lab 04 — Getting Help | Chapter 3: Getting Help | `man`, `info`, help systems and documentation discovery | Planned |
| Lab 05 — Editing Files | Chapter 4: Editing Files | Editors, safe changes and validation | Planned |

Further labs will follow the textbook's order, without inventing results for exercises not yet performed.

## Verified environment

- **Guest:** Kali GNU/Linux Rolling, release **2026.1**, kernel **6.12.38+kali-amd64**.
- **Virtualization:** Oracle VirtualBox (confirmed with `systemd-detect-virt`).
- **Shell:** Bash for the examined user account.
- **Filesystem:** ext4 root filesystem.
- **Workstation workflow:** Visual Studio Code / Remote SSH and authenticated shell access.
- **Scope:** own, isolated learning VM; experiments confined to benign test data or read-only system inspection.

## Evidence philosophy

Each lab links **real terminal screenshots**, the relevant commands and expected/observed behavior. Screenshots are evidence of the command shown, not proof of broader security findings. Where a previous exercise has no retained image, it is explicitly documented as command-level observation, not presented as visual evidence. No private SSH keys, password hashes, personal directories, full unredacted host inventories or copied textbook pages are published.

## Repository layout

```text
Linux-for-Cybersecurity/
├── README.md
├── .gitignore
└── labs/
    └── lab-01-linux-fundamentals-command-line/
        ├── README.md
        ├── evidence/
        │   ├── README.md
        │   └── *.png
        └── scripts/
            └── reproduce.sh
```

## Reproduce the practical exercises

From Kali, with Bash, run the reviewed script in the lab folder:

```bash
bash labs/lab-01-linux-fundamentals-command-line/scripts/reproduce.sh
```

The script runs read-only system queries and generates a disposable workspace for file and archive exercises. It avoids privileged commands and does not modify system configuration.

## Integrity and limits

Dates and outputs in historical screenshots reflect the actual terminal sessions. Reproduction on another distro may differ. A command succeeding is not evidence that a machine is hardened, free of threats, or safe to expose to the internet.
