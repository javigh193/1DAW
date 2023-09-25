# *******************
# DE TEXTO A MARKDOWN
# *******************
import filecmp
from pathlib import Path


def run(text_path: Path) -> bool:
    md_path = "data/txt2md/outline.md"
    # TU CÓDIGO AQUÍ
    with open(text_path) as in_f:
        with open(md_path, "w") as out_f:
            for line in in_f:
                num_tab = line.count("\t") + 1
                md_line = "#" * num_tab + " " + line.lstrip()
                out_f.write(md_line)
    return filecmp.cmp(md_path, "data/txt2md/.expected", shallow=False)


if __name__ == "__main__":
    run("data/txt2md/outline.txt")
