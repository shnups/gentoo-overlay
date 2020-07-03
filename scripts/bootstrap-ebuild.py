#!/usr/bin/env python3.7
from pathlib import Path
from shutil import copyfile
from pprint import pprint as pp
import typer


app = typer.Typer()


@app.command()
def rust(
    from_ebuild: Path = typer.Option(...),
    new_version: str = typer.Option(None)
) -> None:
    if not from_ebuild.is_file() or not from_ebuild.exists():
        typer.Exit(code=1)

    # Define new ebuild version, if none given
    pn, pv = from_ebuild.name.replace('.ebuild', '').split('-')
    if not new_version:
        nums = pv.split('.')
        nums[-1] = str(int(nums[-1]) + 1)
        new_version = '.'.join(nums)

    # Copy ebuild file
    new_ebuild = from_ebuild.as_posix().replace(pv, new_version)
    new_ebuild = Path(copyfile(from_ebuild, new_ebuild))
    content = new_ebuild.read_text()

    # ? empty CRATES
    # get SRC_UI
    
    # dl Cargo,lock

    # read it
    # get a list of 'package-0.1.2',
    # sorted the list
    # insert ${PF}
    # replace it in CRATES=""

if __name__ == "__main__":
    app()
