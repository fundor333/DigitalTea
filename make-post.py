import os


def post_fc():
    year = input("Give me the Year\n")
    name = input("Give me the title\n")
    os.system(f"hugo new post/{year}/{name.replace(' ','-')}/index.md")


ANSWER = {"post": post_fc}


def main_checker():
    text = input("You need a new [post]?\n")  # Python 3
    ANSWER.get(text, main_checker)()


if __name__ == "__main__":
    main_checker()
