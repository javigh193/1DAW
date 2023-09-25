def sort_output(reverse: bool = False):
    def decorator(func):
        def wrapper(*args, **kwargs):
            return sorted(func(*args, **kwargs), reverse=reverse)

        return wrapper

    return decorator


@sort_output()
def txt_to_list(text: str) -> list[str]:
    return text.split()


result = txt_to_list("Hola Dimas, ¿cómo lo llevas?")
print(result)
