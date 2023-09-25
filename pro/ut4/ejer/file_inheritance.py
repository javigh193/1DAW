class File:
    def __init__(self, path: str):
        self.path = path
        self.contents = []

    def add_content(self, content: str):
        self.contents.append(content)

    @property
    def size(self):
        return sum(len(content) for content in self.contents)

    def info(self):
        info = f"{self.path} [size={self.size}B]"
        return info


class MediaFile(File):
    def __init__(self, path: str, codec: str, geoloc: tuple, duration: int):
        super().__init__(path)
        self.codec = codec
        self.latitud, self.longitud = geoloc
        self.duration = duration

    @property
    def geoloc(self):
        return self.latitud, self.longitud

    def info(self):
        info = f"{super().info()}\n"
        info += (
            f"Codec: {self.codec}\n"
            f"Geolocalization: {self.geoloc}\n"
            f"Duration: {self.duration}s"
        )
        return info


class VideoFile(MediaFile):
    def __init__(
        self, path: str, codec: str, geoloc: tuple, duration: int, dimensions: tuple
    ):
        super().__init__(path, codec, geoloc, duration)
        self.width, self.height = dimensions

    @property
    def dimensions(self):
        return self.width, self.height

    def info(self):
        info = f"{super().info()}\n"
        info += f"Dimensions: {self.dimensions}"
        return info


vanrossum = VideoFile(
    "/home/python/vanrossum.mp4", "h264", (23.5454, 31.4343), 487, (1920, 1080)
)
print(vanrossum.info())
