from typing import List


class Gallery:
    def __init__(self, pictures: List[str]):
        self._pictures = pictures

    @property
    def pictures(self):
        return self._pictures
