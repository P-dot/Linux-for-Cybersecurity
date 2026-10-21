# Lab 02 — Evidence index

**Original captures:** 13 PNG files from the authorized Kali terminal session, 21 October 2026. The README includes every screenshot inline next to the associated commands and interpretation.

| # | Filename | Evidentiary purpose |
| --- | --- | --- |
| 01 | [tar missing source](01-tar-missing-source.png) | The literal placeholder `archivos` does not exist; initial failure and empty listing |
| 02 | [tar create, list, extract](02-tar-create-list-extract.png) | Controlled archive with two files; extraction and recursive comparison |
| 03 | [tar compression sizes](03-tar-compression-sizes.png) | Comparison of plain TAR and gzip/bzip2/xz compressed TAR |
| 04 | [tar diff initial](04-tar-diff-initial.png) | Troubleshooting: baseline already differed |
| 05 | [tar diff controlled](05-tar-diff-controlled.png) | Clean baseline followed by a deliberate size change |
| 06 | [gzip input](06-gzip-input.png) | Repetitive data generation and initial size |
| 07 | [gzip compressed](07-gzip-compressed.png) | gzip -v and 99.7% reported reduction |
| 08 | [gzip decompressed](08-gzip-decompress.png) | gzip -d restores the original |
| 09 | [gzip preserve and cmp](09-gzip-preserve-and-cmp.png) | gzip -c preserves the source; cmp returns 0 |
| 10 | [gzip recursive](10-gzip-recursive.png) | Individual .gz outputs and negative savings for tiny files |
| 11 | [gunzip recover](11-gunzip-recover.png) | Successful recovery after a corrected typing mistake |
| 12 | [gunzip preserve](12-gunzip-preserve.png) | gunzip -c keeps the compressed file |
| 13 | [gunzip SHA-256 and integrity](13-gunzip-sha256-integrity.png) | Matching hashes and gzip -t exit code 0 |

## Interpretation rules

Screenshots are historical terminal evidence; they are **not** claims that the experiments were executed anew at publication time. A quiet `diff` or `cmp` indicates no differences were printed; `cmp`'s explicitly displayed exit code 0 provides stronger status evidence. SHA-256 equality demonstrates matching byte content, not provenance of the file. The observed compressed sizes are dataset-specific.

No credentials, private SSH keys, personal documents or third-party endpoints are included. The book's next section, `bzip2`, remains unperformed as a standalone exercise.
