import httpx
import rich
import toml
import typer

app = typer.Typer()


@app.command()
def run(
    cargo_lock_url: str, copy_to_clipboard: bool = typer.Option(False, "--clipboard")
):
    response = httpx.get(cargo_lock_url)
    response.raise_for_status()

    cargo_lock = toml.loads(response.text)
    if not cargo_lock:
        typer.echo("no cargo lock content", err=True)
        raise typer.Abort()

    packages = cargo_lock.get("package", [])
    typer.echo(f"Found {len(packages)} packages ...")
    if not packages:
        raise typer.Abort()

    output = ""
    for pkg in packages:
        output += f'\t{pkg["name"]}-{pkg["version"]}\n'

    if copy_to_clipboard:
        import pyclip

        pyclip.copy(output)
        typer.echo("CRATES list copied to clipboard!")
    else:
        print(output)


if __name__ == "__main__":
    app()
