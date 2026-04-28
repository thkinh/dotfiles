#!/usr/bin/env python3
import re
import shutil
import pandoc
from pathlib import Path

SCRIPT_DIR = Path(__file__).parent
CSS_SRC    = SCRIPT_DIR / "docs.css"

docs_dir = Path("docs")
docs_dir.mkdir(exist_ok=True)

img_src = Path("img")
if img_src.exists():
    shutil.copytree(img_src, docs_dir / "img", dirs_exist_ok=True)

if CSS_SRC.exists():
    shutil.copy(CSS_SRC, docs_dir / "docs.css")

for md_file in Path(".").glob("*.md"):
    content = md_file.read_text(encoding="utf-8")
    converted = re.sub(r'\]\(([A-Za-z0-9_-]+)\)', r'](\1.html)', content)

    out_file = docs_dir / md_file.with_suffix(".html").name

    doc = pandoc.read(converted, format="markdown+tex_math_dollars+tex_math_single_backslash")
    pandoc.write(doc, file=str(out_file), format="html", options=[
        "--standalone",
        "--mathjax",
    ])

    print(f"Converted {md_file} -> {out_file}")
