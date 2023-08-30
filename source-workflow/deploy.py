import zipfile
import pathlib
import os

print("Starting")

# 创建工作目录
os.makedirs("release", exist_ok=True)

# 排除掉文件和特殊文件夹
florders = pathlib.Path(".").glob("*/")
for directory in florders:
    if (
        not directory.name.startswith(".")
        and not directory.name.startswith("sp")
        and not directory.name.startswith("source")
        and os.path.isdir("./" + directory.name)
        and directory.name != "release"
    ):
        print("Current florder: " + directory.name)
        # test\<directory>.zip
        with zipfile.ZipFile(
            pathlib.Path("release") / directory.with_suffix(directory.suffix + ".zip").name,
            "w",
            compression=zipfile.ZIP_DEFLATED,
            compresslevel=9,
        ) as zfile:
            for item in directory.rglob("*"):
                zfile.write(item, arcname=item.relative_to(directory))

print("All Done")
