"""Download and verify the formula for the latest public CretSpec release."""

import hashlib
import io
import json
from pathlib import Path
import re
import urllib.request
import zipfile

REPOSITORY = "https://github.com/yveslaurentcreton/CretSpec"


def download(url):
    request = urllib.request.Request(url, headers={"User-Agent": "cretspec-homebrew-tap"})
    return urllib.request.urlopen(request, timeout=60).read()


release = json.loads(download("https://api.github.com/repos/yveslaurentcreton/CretSpec/releases/latest"))
tag = release["tag_name"]
if release["draft"] or release["prerelease"] or not re.fullmatch(r"v(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)", tag):
    raise ValueError("Expected a stable, published release")
version = tag[1:]
base = f"{REPOSITORY}/releases/download/{tag}"
checksums = dict(line.split()[::-1] for line in download(f"{base}/SHA256SUMS").decode().splitlines())
with zipfile.ZipFile(io.BytesIO(download(f"{base}/cretspec-{version}-packages.zip"))) as archive:
    formula = archive.read("homebrew/Formula/cretspec.rb").decode("utf-8")
if f'  version "{version}"' not in formula:
    raise ValueError("Formula version does not match the release")
for architecture in ("aarch64", "x86_64"):
    name = f"cretspec-{version}-{architecture}-apple-darwin.tar.gz"
    url = f"{base}/{name}"
    checksum = hashlib.sha256(download(url)).hexdigest()
    if checksum != checksums[name] or f'url "{url}"' not in formula or f'sha256 "{checksum}"' not in formula:
        raise ValueError(f"Formula or archive checksum mismatch: {name}")
Path("Formula/cretspec.rb").write_text(formula, encoding="utf-8", newline="\n")
print(f"Verified CretSpec {version}")
