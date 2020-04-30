class UIFactory:
    """
    UIFactory made for providing common interface for all my custom widgets.
    
    instantiate: _create_views -> _orgnize_views -> _show_views
    """
    
    def __init__(self):
        # NOTE: when subclass finishes itself init, then call super().__init__()
        self._create_views()
        self._orgnize_views()
        self._show_views()
    
    def _create_views(self):
        raise NotImplementedError
    
    def _orgnize_views(self):
        raise NotImplementedError
    
    def _show_views(self):
        raise NotImplementedError
