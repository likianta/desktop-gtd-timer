def minute_int_2_label(minutes: int):
    hour, minute = minutes // 60, minutes % 60
    return '{}:{}:00'.format(
        str(hour).zfill(2),
        str(minute).zfill(2)
    )
