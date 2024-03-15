from PIL import Image
import http.server
import socketserver
import os
import sys


def string_to_binary(string: str):
    return [bin(ord(i))[2:].rjust(8, "0") for i in string]


img_src = Image.open("./src.png").convert("RGB")

flag = sys.argv[1]
print("Flag: {}".format(flag))
flag = "".join([i for i in string_to_binary(sys.argv[1])])
flag = [i for i in flag]
print("FLag binary: {}".format(flag))

W, H = img_src.size

img_dst = Image.new(img_src.mode, (W, H))

for y in range(H):
    for x in range(W):
        if flag:
            pixel = img_src.getpixel((x, y))
            pixel = (int(bin(pixel[0])[2:][:-1] + flag.pop(0), 2), pixel[1], pixel[2])
            img_dst.putpixel((x, y), pixel)
        else:
            img_dst.putpixel((x, y), img_src.getpixel((x, y)))

os.mkdir("./http")
img_dst.save("./http/dst.png")


class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory="./http", **kwargs)

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-Disposition", 'attachment; filename="dst.png"')
            self.send_header("Content-type", "application/octet-stream")
            self.end_headers()

            # 读取文件内容并发送给客户端
            with open("./http/dst.png", "rb") as file:
                self.wfile.write(file.read())
        else:
            # 调用父类的默认处理方法
            super().do_GET()


with socketserver.TCPServer(("0.0.0.0", 8080), Handler) as httpd:
    print("Server is running\nhttp://0.0.0.0:8080/")
    httpd.serve_forever()
