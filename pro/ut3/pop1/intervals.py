# ********************
# INTERVALO DESPLEGADO
# ********************


def run(interval: str) -> list:
    irange = []
    interval_extrems = interval.strip("[]()").split(",")
    interval_start = int(interval_extrems[0])
    interval_end = int(interval_extrems[1])
    if interval[0] == "[":
        irange.append(interval_start)
    for i in range(interval_start + 1, interval_end):
        irange.append(i)
    if interval[-1] == "]":
        irange.append(interval_end)
    return irange


if __name__ == "__main__":
    run("[3,10]")
