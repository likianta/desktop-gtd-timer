def main(start=1, end=25, ofile='../../test/test.txt'):
    """
    生成预设的时长.
    每隔 10min 一个, 共生成 30 个, 也就是到 5 小时: 10min, 20min, 30min, 40min,
    ... 5h
    这些值都要以秒数来表示.
    用途: 用于 conf/preset.json.
    
    :param start: 开始的分钟数 (乘十).
    :param end: 结束的分钟数 (乘十).
    :param ofile: 输出到一个临时的文件里.
    :return: [600, 1200, 1800, 2400, 3000, 3600, 4200, 4800, 5400, 6000, 6600,
        7200, 7800, 8400, 9000, 9600, 10200, 10800, 11400, 12000, 12600, 13200,
        13800, 14400,]
    """
    from lk_utils import read_and_write
    
    w = []
    for m in range(start, end):
        s = m * 10 * 600
        w.append(s)
    read_and_write.dumps(w, ofile)
