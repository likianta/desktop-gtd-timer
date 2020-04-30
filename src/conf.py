from lk_utils import read_and_write


class _Config:
    
    def __init__(self):
        self.preset = read_and_write.loads('../conf/preset.json')
        self.user = read_and_write.loads('../conf/user.json')
    
    def get_init_timer_items(self):
        return self._query('timer_items')
    
    def get_init_clocking_items(self):
        return self._query('clocking_items')
    
    def _query(self, q: str):
        if (x := self.user.get(q)) is not None:
            return x
        else:
            return self.preset.get(q)
        

cfg = _Config()
